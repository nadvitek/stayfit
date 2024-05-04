import Foundation
import SwiftUI

struct TrainingItem: Identifiable {
    let id = UUID()
    var trainingType: TrainingType
    var place: String
    var notes: String
    var date: Date
    var image: Image?
    var isNotificationOn: Bool
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
            image: Image(systemName: "plus"),
            isNotificationOn: false
        )
    }
}

#endif
