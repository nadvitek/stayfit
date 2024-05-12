import Foundation

@Observable
class EditTrainingViewModelMock: EditTrainingViewModeling {
    
    // MARK: - Internal properties
    
    var trainingItem: TrainingItem
    var typeSelected: Bool = false
    var dateSelected: Bool = false
    var isNotificationOn: Bool = false

    var editCompleted: Bool = false
    
    // MARK: - Initializers
    
    init(
        trainingItem: TrainingItem = .mock()
    ) {
        self.trainingItem = trainingItem
    }

    func editTraining() {
        // do nothing
    }
}
