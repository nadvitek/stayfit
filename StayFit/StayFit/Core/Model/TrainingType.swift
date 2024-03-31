import Foundation
import SwiftUI

enum TrainingType: String, CaseIterable {
    case running = "Running"
    case yoga = "Yoga"
    case soccer = "Soccer"
    case swimming = "Swimming"
    case lifting = "Lifting"
    
    var image: Image {
        switch self {
        case .running:
            Image(systemName: "figure.run")
        case .yoga:
            Image(systemName: "figure.yoga")
        case .soccer:
            Image(systemName: "figure.soccer")
        case .swimming:
            Image(systemName: "figure.pool.swim")
        case .lifting:
            Image(systemName: "figure.strengthtraining.traditional")
        }
    }
}
