import Foundation

protocol EditTrainingViewModeling {
    var trainingItem: TrainingItem { get set }
    var isNotificationOn: Bool { get set }
    
    var editCompleted: Bool { get set }
    
    func editTraining()
    func deleteTraining(completionHandler: @escaping (Bool) -> Void)
    func onNotificationChanged(to value: Bool)
}

@Observable
class EditTrainingViewModel: EditTrainingViewModeling {
    
    // MARK: - Internal properties
    
    var trainingItem: TrainingItem
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
    
    // MARK: - Internal interface
    
    func editTraining() {
        Task {
            await dependencies.dataManager.saveTraining(trainingItem)
            editCompleted = true
        }
    }
    
    func deleteTraining(completionHandler: @escaping (Bool) -> Void) {
        Task { @MainActor in
            let result = await dependencies.dataManager.deleteTraining(of: trainingItem.id)
            completionHandler(result)
        }
    }
    
    func onNotificationChanged(to value: Bool) {
        if value {
            dependencies.notificationManager.scheduleLocalNotification(trainingItem)
        } else {
            dependencies.notificationManager.cancelNotification(of: trainingItem.id)
        }
    }
}
