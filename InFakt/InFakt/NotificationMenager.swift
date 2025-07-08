//
//  NotificationMenager.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import Foundation
import UserNotifications

class NotificationMenager {
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }
    
    func scheduleNotification(after seconds: TimeInterval, title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { _ in }
    }
}
