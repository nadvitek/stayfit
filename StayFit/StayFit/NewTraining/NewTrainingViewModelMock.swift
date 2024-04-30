import Foundation
import SwiftUI

@Observable
class NewTrainingViewModelMock: NewTrainingViewModeling {
    
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
        place: String = "Barandov",
        date: Date = .now,
        notes: String = "Těžký trénink"
    ) {
        self.trainingType = trainingType
        self.place = place
        self.date = date
        self.notes = notes
    }
}
