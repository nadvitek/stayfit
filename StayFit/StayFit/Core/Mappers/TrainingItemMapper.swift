import Foundation
import FirebaseCore
import FirebaseFirestore

enum TrainingItemMapper {
    static func mapToTrainingItem(_ document: QueryDocumentSnapshot) -> TrainingItem {
        let data = document.data()
        
        return TrainingItem(
            trainingType: mapToTrainingType(data[FirebaseKeys.trainingType] as? String),
            place: data[FirebaseKeys.place] as? String ?? "",
            notes: data[FirebaseKeys.notes] as? String ?? "",
            date: mapToDate(data[FirebaseKeys.date] as? String ?? ""),
            isNotificationOn: data[FirebaseKeys.isNotificationOn] as? Bool ?? false
        )
    }
    
    private static func mapToTrainingType(_ typeAsString: String?) -> TrainingType {
        switch typeAsString {
        case "running":
            return .running
        case "yoga":
            return .yoga
        case "swimming":
            return .swimming
        case "lifting":
            return .lifting
        case "soccer":
            return .soccer
        default:
            return .running
        }
    }
    
    private static func mapToDate(_ dateAsString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateAsString) {
            return date
        } else {
            return .now
        }
    }
}
