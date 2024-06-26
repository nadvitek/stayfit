import Foundation
import UIKit

@Observable
class EditTrainingViewModelMock: EditTrainingViewModeling {
    
    // MARK: - Internal properties
    
    var trainingItem: TrainingItem
    var typeSelected: Bool = false
    var dateSelected: Bool = false
    var isNotificationOn: Bool = false

    var editCompleted: Bool = false
    var showCamera: Bool = false
    
    // MARK: - Initializers
    
    init(
        trainingItem: TrainingItem = .mock()
    ) {
        self.trainingItem = trainingItem
    }

    func editTraining() {
        // do nothing
    }
    
    func deleteTraining(completionHandler: @escaping (Bool) -> Void) {
        // do nothing
    }
    
    func onNotificationChanged(to value: Bool) {
        // do nothing
    }
    
    func imagePickerCompletionHandler(_ image: UIImage) {
        // do nothing
    }
}
