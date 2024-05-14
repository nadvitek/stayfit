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
    func loadData()
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
    }
    
    // MARK: - Internal interface
    
    func clearFilter() {
        dateFilterActivated = false
        typeFilterActivated = false
    }

    func loadData() {
        Task {
            do {
                data = try await dependencies.dataManager.retrieveTrainingList().map(TrainingItemMapper.mapToTrainingItem)
                isLoading = false
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: - Private helpers
    
    private func processData() -> [String: [TrainingItem]] {
        var output: [String: [TrainingItem]] = [:]
        var coppiedData = data
        
        if dateFilterActivated {
            coppiedData = coppiedData.filter { $0.date.parseDateToString() == filteredDate.parseDateToString() }
        }
        
        if typeFilterActivated {
            coppiedData = coppiedData.filter { $0.trainingType == filteredType }
        }
        
        coppiedData.sort { $0.date > $1.date }
        
        for i in 0..<coppiedData.count {
            let month = monthString(from: coppiedData[i].date)
            let year = yearString(from: coppiedData[i].date)
            
            let key = "\(month) \(year)"
            
            if output[key] != nil {
                output[key]?.append(coppiedData[i])
            } else {
                output[key] = [coppiedData[i]]
            }
        }
        
        return output
    }
    
    private func filterByDate(data: inout [TrainingItem]) {
        
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
