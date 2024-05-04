import Foundation

protocol TrainingDetailViewModeling {
    var trainingItem: TrainingItem { get }
}

@Observable
class TrainingDetailViewModel: TrainingDetailViewModeling {
    
    // MARK: - Internal properties
    
    var trainingItem: TrainingItem
    
    // MARK: - Initializers
    
    init(trainingItem: TrainingItem) {
        self.trainingItem = trainingItem
    }
}
