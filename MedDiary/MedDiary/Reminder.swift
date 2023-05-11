//
//  Reminder.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/1/23.
//

import Foundation

import UIKit

struct Reminder: Codable {
     enum Images: Int, CaseIterable, Codable {
            case pill

            var image: UIImage {
                guard let image = UIImage(named: String(describing: self)) else {
                    fatalError("image \(self) not found")
                }

                return image
            }
        }
    
    
    var title: String
    let dateCreated: Date = Date()
    var selectedImage: Reminder.Images
    var lastCompletionDate: Date?
    
    var completedToday: Bool {
            return lastCompletionDate?.isToday ?? false
        }
    // Add this initializer
      init(title: String, image: Reminder.Images) {
          self.title = title
          self.selectedImage = image
      }
}
