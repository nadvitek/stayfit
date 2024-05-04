import Foundation

protocol EditTrainingViewModeling {
    var trainingItem: TrainingItem { get set }
    var typeSelected: Bool { get set }
    var dateSelected: Bool { get set }
    var isNotificationOn: Bool { get set }
}

@Observable
class EditTrainingViewModel: EditTrainingViewModeling {
    
    // MARK: - Internal properties
    
    var trainingItem: TrainingItem
    var typeSelected: Bool = false
    var dateSelected: Bool = false
    var isNotificationOn: Bool = false
    
    // MARK: - Initializers
    
    init(
        trainingItem: TrainingItem
    ) {
        self.trainingItem = trainingItem
    }
}
