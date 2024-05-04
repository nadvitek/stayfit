import Foundation
import SwiftUI

protocol NewTrainingViewModeling {
    var trainingType: TrainingType { get set }
    var place: String { get set }
    var date: Date { get set }
    var notes: String { get set }
    var typeSelected: Bool { get set }
    var dateSelected: Bool { get set }
    var isNotificationOn: Bool { get set }
    var image: Image? { get set }
    
    func createTraining()
}

@Observable
class NewTrainingViewModel: NewTrainingViewModeling {
    
    // MARK: - Internal properties
    
    var trainingType: TrainingType = .lifting
    var place: String = ""
    var date: Date = .now
    var notes: String = ""
    var typeSelected: Bool = false
    var dateSelected: Bool = false
    var isNotificationOn: Bool = false
    var image: Image? = nil
    
    // MARK: - Private properties
    
    private let dependencies: AppDependency
    
    // MARK: - Initializers
    
    init(dependencies: AppDependency) {
        self.dependencies = dependencies
    }
    
    // MARK: - Internal interface
    
    func createTraining() {
        dependencies.dataManager.createNewTraining()
        TrainingItem(
            trainingType: <#T##TrainingType#>,
            place: <#T##String#>,
            notes: <#T##String#>,
            date: <#T##Date#>,
            image: <#T##Image?#>,
            isNotificationOn: <#T##Bool#>
        )
    }
}
