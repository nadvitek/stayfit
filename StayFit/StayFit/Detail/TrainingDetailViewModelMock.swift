import Foundation

@Observable
class TrainingDetailViewModelMock: TrainingDetailViewModeling {

    // MARK: - Internal properties
    
    var trainingItem: TrainingItem?
    var loaded: Bool = false
    var trainingDeleted: Bool = false
    
    // MARK: - Initializers
    
    init(trainingItem: TrainingItem = .mock()) {
//        self.trainingItem = trainingItem
    }

    func loadTraining() {
        // do nothing
    }
}
