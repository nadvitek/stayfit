import Foundation

struct TrainingItem: Identifiable {
    let id = UUID()
    let trainingType: TrainingType
    let place: String
    let notes: String
    let date: Date
}
