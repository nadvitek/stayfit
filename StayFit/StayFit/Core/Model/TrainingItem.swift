import Foundation
import SwiftUI

struct TrainingItem: Identifiable {
    var id = UUID().uuidString
    var trainingType: TrainingType
    var place: String
    var notes: String
    var date: Date
    var image: UIImage?
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
            image: UIImage(systemName: "plus"),
            isNotificationOn: false
        )
    }
}

#endif
