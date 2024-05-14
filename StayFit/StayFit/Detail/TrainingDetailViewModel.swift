import Foundation

protocol TrainingDetailViewModeling {
    var trainingItem: TrainingItem? { get set }
    var trainingDeleted: Bool { get set }
    
    func loadTraining()
}

@Observable
class TrainingDetailViewModel: TrainingDetailViewModeling {
    
    // MARK: - Internal properties
    
    var trainingItem: TrainingItem?
    var trainingDeleted: Bool = false
    
    // MARK: - Private proeperties
    
    private var trainingId: String
    private var dependencies: AppDependency
    
    // MARK: - Initializers
    
    init(
        dependencies: AppDependency,
        trainingId: String
    ) {
        self.trainingId = trainingId
        self.dependencies = dependencies
    }
    
    // MARK: - Private helpers
    
    func loadTraining() {
        Task {
            trainingItem = await dependencies.dataManager.retrieveTraining(of: trainingId).map(TrainingItemMapper.mapToTrainingItem)
        }
    }
}
