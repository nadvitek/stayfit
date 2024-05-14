import Foundation
import NotificationCenter

protocol NotificationManaging {
    func scheduleLocalNotification(_ trainingItem: TrainingItem)
    func cancelNotification(of id: String)
}

final class NotificationManager: NotificationManaging {
    
    // MARK: - Internal interface

    func scheduleLocalNotification(_ trainingItem: TrainingItem) {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            guard let self else { return }
            if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                let content = UNMutableNotificationContent()
                
                content.title = "Training today!"
                content.body = "Today, you have a training of \(trainingItem.trainingType.rawValue)"
                content.sound = UNNotificationSound.default
                
                let notificationDate = createDateForNotification(trainingItem.date)
                
                let dateInfo = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: notificationDate)
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
                
                let request = UNNotificationRequest(identifier: trainingItem.id, content: content, trigger: trigger)
                let notificationCenter = UNUserNotificationCenter.current()
                notificationCenter.add(request) { (error) in
                    if error != nil{
                        print("error in notification! ")
                    }
                }
            }
        }
    }
    
    func cancelNotification(of id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
    
    // MARK: - Private helpers
    
    private func createDateForNotification(_ date: Date) -> Date {
        let calendar = Calendar.current
        
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)

        var newDateComponents = DateComponents()
        newDateComponents.year = dateComponents.year
        newDateComponents.month = dateComponents.month
        newDateComponents.day = dateComponents.day
        newDateComponents.hour = 9
        newDateComponents.minute = 0


        if let newDate = calendar.date(from: newDateComponents) {
            return newDate
        }

        return date
    }
}
