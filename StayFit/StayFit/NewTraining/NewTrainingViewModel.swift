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
    var showCamera: Bool { get set }
    
    var creationCompleted: Bool { get }
    
    func createTraining()
    func imagePickerCompletionHandler(_ image: UIImage)
}

@Observable
class NewTrainingViewModel: NewTrainingViewModeling {
    
    // MARK: - Internal properties
    
    var trainingType: TrainingType = .lifting {
        didSet {
            typeSelected = true
        }
    }
    var place: String = ""
    var date: Date = .now {
        didSet {
            dateSelected = true
        }
    }
    var notes: String = ""
    var typeSelected: Bool = false
    var dateSelected: Bool = false
    var isNotificationOn: Bool = false
    var image: Image? = nil
    var showCamera: Bool = false
    
    var creationCompleted: Bool = false
    
    // MARK: - Private properties
    
    private let dependencies: AppDependency
    
    // MARK: - Initializers
    
    init(dependencies: AppDependency) {
        self.dependencies = dependencies
    }
    
    // MARK: - Internal interface
    
    func createTraining() {
        let training = TrainingItem(
            trainingType: trainingType,
            place: place,
            notes: notes,
            date: date,
            isNotificationOn: isNotificationOn
        )
        
        if isNotificationOn {
            dependencies.notificationManager.scheduleLocalNotification(training)
        }

        Task {
            await dependencies.dataManager.saveTraining(training)
            creationCompleted = true
        }
    }
    
    func imagePickerCompletionHandler(_ image: UIImage) {
        self.image = Image(uiImage: image)
        showCamera = false
    }
}
