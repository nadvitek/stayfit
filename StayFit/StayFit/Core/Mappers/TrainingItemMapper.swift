import Foundation
import FirebaseCore
import FirebaseFirestore
import SwiftUI

enum TrainingItemMapper {
    static func mapToTrainingItem(_ document: QueryDocumentSnapshot) -> TrainingItem {
        let data = document.data()
        
        return TrainingItem(
            id: data[FirebaseKeys.id] as? String ?? "",
            trainingType: mapToTrainingType(data[FirebaseKeys.trainingType] as? String),
            place: data[FirebaseKeys.place] as? String ?? "",
            notes: data[FirebaseKeys.notes] as? String ?? "",
            date: mapToDate(data[FirebaseKeys.date] as? String ?? ""),
            image: mapStringToImage(data[FirebaseKeys.image] as? String ?? ""),
            isNotificationOn: data[FirebaseKeys.isNotificationOn] as? Bool ?? false
        )
    }
    
    static func mapToTrainingItem(_ document: DocumentSnapshot) -> TrainingItem {
        let data = document.data()
        
        return TrainingItem(
            id: data?[FirebaseKeys.id] as? String ?? "",
            trainingType: mapToTrainingType(data?[FirebaseKeys.trainingType] as? String),
            place: data?[FirebaseKeys.place] as? String ?? "",
            notes: data?[FirebaseKeys.notes] as? String ?? "",
            date: mapToDate(data?[FirebaseKeys.date] as? String ?? ""),
            image: mapStringToImage(data?[FirebaseKeys.image] as? String ?? ""),
            isNotificationOn: data?[FirebaseKeys.isNotificationOn] as? Bool ?? false
        )
    }
    
    static func mapToFirebase(_ trainingItem: TrainingItem) -> [String: Any] {
        return [
            FirebaseKeys.id: trainingItem.id,
            FirebaseKeys.trainingType: trainingItem.trainingType.rawValue.lowercased(),
            FirebaseKeys.place: trainingItem.place,
            FirebaseKeys.notes: trainingItem.notes,
            FirebaseKeys.date: trainingItem.date.parseDateToString(),
            FirebaseKeys.image: mapImageToString(trainingItem.image),
            FirebaseKeys.isNotificationOn: trainingItem.isNotificationOn
        ]
    }
    
    private static func mapImageToString(_ image: UIImage?) -> String {
        guard let image else { return "" }
        
        let data = image.jpegData(compressionQuality: 0.7)!
        
        let imageString = data.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return imageString
    }
    
    private static func mapStringToImage(_ data: String) -> UIImage? {
        guard let decodedData = NSData(base64Encoded: data, options: NSData.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        
        let image = UIImage(data: decodedData as Data)
        return image
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
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        if let date = dateFormatter.date(from: dateAsString) {
            return date
        } else {
            return .now
        }
    }
}
