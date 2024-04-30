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
}

@Observable
class NewTrainingViewModel: NewTrainingViewModeling {
    
    // MARK: - Internal properties
    
    var trainingType: TrainingType
    var place: String
    var date: Date
    var notes: String
    var typeSelected: Bool = false
    var dateSelected: Bool = false
    var isNotificationOn: Bool = false
    var image: Image? = nil
    
    // MARK: - Initializers
    
    init(
        trainingType: TrainingType = .running,
        place: String,
        date: Date,
        notes: String
    ) {
        self.trainingType = trainingType
        self.place = place
        self.date = date
        self.notes = notes
    }
}
