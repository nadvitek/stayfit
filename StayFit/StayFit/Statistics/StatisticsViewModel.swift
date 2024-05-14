import Foundation
import Observation

protocol StatisticsViewModeling {
    var favoriteActivity: TrainingType { get }
    var bestMonth: String { get }
    var monthRecord: Int { get }
    
    var loaded: Bool { get set }
    
    func loadData()
}

@Observable
class StatisticsViewModel: StatisticsViewModeling {
    
    // MARK: - Internal properties

    var favoriteActivity: TrainingType = .running
    var bestMonth: String = ""
    var monthRecord: Int = 0
    
    var loaded: Bool = false
    
    // MARK: - Private properties
    
    private var dependencies: AppDependency
    private var data: [TrainingItem] = [] {
        didSet {
            processData()
        }
    }
    
    // MARK: - Initializers
    
    init(dependencies: AppDependency) {
        self.dependencies = dependencies
    }
    
    // MARK: - Internal interface
    
    func loadData() {
        Task {
            do {
                self.data = try await dependencies.dataManager.retrieveTrainingList().map(TrainingItemMapper.mapToTrainingItem)
            } catch {
                print("Loading statistics failed")
            }
        }
    }
    
    // MARK: - Private helpers
    
    private func processData() {
        var output: [String: [TrainingItem]] = [:]
        var coppiedData = data
        
        var favoriteTraining: [TrainingType: Int] = [:]
        
        for item in coppiedData {
            let month = monthString(from: item.date)
            let year = yearString(from: item.date)
            
            let key = "\(month) \(year)"
            
            if output[key] != nil {
                output[key]?.append(item)
            } else {
                output[key] = [item]
            }
            
            if favoriteTraining[item.trainingType] != nil {
                favoriteTraining[item.trainingType]? += 1
            } else {
                favoriteTraining[item.trainingType] = 1
            }
        }
        
        output.forEach { key, value in
            if value.count > monthRecord {
                monthRecord = value.count
                bestMonth = key
            }
        }
        
        var bestValue = 0
        favoriteTraining.forEach { key, value in
            if value > bestValue {
                bestValue = value
                favoriteActivity = key
            }
        }
        
        loaded = true
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
