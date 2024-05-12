import Foundation

@Observable
class TrainingDetailViewModelMock: TrainingDetailViewModeling {

    // MARK: - Internal properties
    
    var trainingItem: TrainingItem?
    
    // MARK: - Initializers
    
    init(trainingItem: TrainingItem = .mock()) {
        self.trainingItem = trainingItem
    }
}
