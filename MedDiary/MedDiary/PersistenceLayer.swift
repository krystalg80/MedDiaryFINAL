//
//  PersistenceLayer.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/9/23.
//

import Foundation

struct PersistenceLayer {
    // Step 1
    private(set) var reminders: [Reminder] = []

    // Step 2
    private static let userDefaultsRemindersKeyValue = "Reminders_ARRAY"

    init() {
        // Step 3
        self.loadReminders()
    }
    // Step 4
    private mutating func loadReminders() {

   // Step 5
   let userDefaults = UserDefaults.standard

   // Step 6
   guard let reminderData = userDefaults.data(forKey: PersistenceLayer.userDefaultsRemindersKeyValue),
       let reminders = try? JSONDecoder().decode([Reminder].self, from: reminderData) else {
       return
       }

       self.reminders = reminders
    }
    // Step 7
    @discardableResult
    // Step 8
    mutating func createNewReminder(name: String, image: Reminder.Images) -> Reminder {
       let newReminder = Reminder(title: name, image: image)
       self.reminders.insert(newReminder, at: 0) // Prepend the habits to the array
       self.saveReminders()

       return newReminder
    }
    private func saveReminders() {
   // Step 9
   guard let remindersData = try? JSONEncoder().encode(self.reminders) else {
       fatalError("could not encode list of reminders")
   }

   // Step 10
   let userDefaults = UserDefaults.standard
   userDefaults.set(remindersData, forKey: PersistenceLayer.userDefaultsRemindersKeyValue)
   userDefaults.synchronize()
    }
    // Step 11
    mutating func delete(_ reminderIndex: Int) {
        // Remove habit at the given index
        self.reminders.remove(at: reminderIndex)

        // Persist on the changes we made to our habits array
        self.saveReminders()
    }
    mutating func markReminderAsCompleted(_ reminderIndex: Int) -> Reminder {
        // Step 12
        var updatedReminder = self.reminders[reminderIndex]

        // Step 13
        guard updatedReminder.completedToday == false else { return updatedReminder }

       

        // Step 14
        if let lastCompletionDate = updatedReminder.lastCompletionDate, lastCompletionDate.isYesterday {
        } else {
        }

        // Step 16
        let now = Date()
        updatedReminder.lastCompletionDate = now

        // Step 17
        self.reminders[reminderIndex] = updatedReminder

        // Step 18
        self.saveReminders()
        return updatedReminder
    }
    // Step 19
    mutating func swapReminders(reminderIndex: Int, destinationIndex: Int) {
        let reminderToSwap = self.reminders[reminderIndex]
        self.reminders.remove(at: reminderIndex)
        self.reminders.insert(reminderToSwap, at: destinationIndex)
        self.saveReminders()
    }

    // Step 20
    mutating func setNeedsToReloadReminders() {
        self.loadReminders()
    }
}
