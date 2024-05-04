import Foundation

protocol SFMenuViewModeling {
    var filteredType: TrainingType { get set }
    var filteredDate: Date { get set }
    var filterActivated: Bool { get }
    var dateFilterActivated: Bool { get set }
    var typeFilterActivated: Bool { get set }
    var visibleData: [String: [TrainingItem]] { get }
    
    var isLoading: Bool { get set }
    
    func clearFilter()
}

@Observable
class SFMenuViewModel: SFMenuViewModeling {
    
    // MARK: - Internal properties

    var filteredType: TrainingType = .running {
        didSet {
            typeFilterActivated = true
        }
    }
    var filteredDate: Date = Date() {
        didSet {
            dateFilterActivated = true
        }
    }
    var filterActivated: Bool {
        typeFilterActivated || dateFilterActivated
    }
    var visibleData: [String: [TrainingItem]] {
        processData()
    }
    var dateFilterActivated: Bool = false
    var typeFilterActivated: Bool = false
    
    var isLoading: Bool = true
    
    // MARK: - Private properties
    
    private var data: [TrainingItem] = []
    private let dependencies: AppDependency
    
    // MARK: - Initializers
    
    init(dependencies: AppDependency) {
        self.dependencies = dependencies
        
        loadData()
    }
    
    // MARK: - Internal interface
    
    func clearFilter() {
        dateFilterActivated = false
        typeFilterActivated = false
    }
    
    // MARK: - Private helpers
    
    private func loadData() {
        Task {
            do {
                let documents = try await dependencies.dataManager.retrieveTrainingList().map(TrainingItemMapper.mapToTrainingItem)
                isLoading = false
            } catch {
                print(error)
            }
        }
    }
    
    private func sortData() {
        data.sort { $0.date > $1.date }
    }
    
    private func processData() -> [String: [TrainingItem]] {
        var output: [String: [TrainingItem]] = [:]
        var coppiedData = data
        
        if dateFilterActivated {
//            filterByDate()
        }
        
        if typeFilterActivated {
            coppiedData = coppiedData.filter { $0.trainingType == filteredType }
        }
        
        for item in data {
            let month = monthString(from: item.date)
            let year = yearString(from: item.date)
            
            let key = "\(month) \(year)"
            
            if output[key] != nil {
                output[key]?.append(item)
            } else {
                output[key] = [item]
            }
        }
        
        return output
    }
    
    private func filterByDate(data: inout [TrainingItem]) {
        
    }
    
    private func filterByType(data: inout [TrainingItem]) {
        
    }
    
    private func monthString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }
    
    private func yearString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
}
