import Foundation

protocol EditTrainingViewModeling {
    var trainingItem: TrainingItem { get set }
    var typeSelected: Bool { get set }
    var dateSelected: Bool { get set }
    var isNotificationOn: Bool { get set }
    
    var editCompleted: Bool { get set }
    
    func editTraining()
}

@Observable
class EditTrainingViewModel: EditTrainingViewModeling {
    
    // MARK: - Internal properties
    
    var trainingItem: TrainingItem
    var typeSelected: Bool = false
    var dateSelected: Bool = false
    var isNotificationOn: Bool = false
    
    var editCompleted: Bool = false
    
    // MARK: - Private properties
    
    private var dependencies: AppDependency
    
    // MARK: - Initializers
    
    init(
        dependencies: AppDependency,
        trainingItem: TrainingItem
    ) {
        self.dependencies = dependencies
        self.trainingItem = trainingItem
    }
    
    func editTraining() {
        Task {
            await dependencies.dataManager.saveTraining(trainingItem)
            editCompleted = true
        }
    }
}
