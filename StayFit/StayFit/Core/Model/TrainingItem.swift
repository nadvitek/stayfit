import Foundation
import SwiftUI

struct TrainingItem: Identifiable {
    let id = UUID()
    let trainingType: TrainingType
    let place: String
    let notes: String
    let date: Date
    let image: Image?
}

#if DEBUG

// MARK: - Mock data

extension TrainingItem {
    static func mock() -> TrainingItem {
        .init(
            trainingType: .running,
            place: "Libeň",
            notes: "Náročný",
            date: .now,
            image: Image(systemName: "plus")
        )
    }
}

#endif
