//
//  ReminderTableViewCell.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/9/23.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {


    @IBOutlet weak var labelReminderTitle: UILabel!
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    
    // Set the identifier for the custom cell
    static let identifier = "ReminderCell"

    // Returning the xib file after instantiating it
    static var nib: UINib {
      return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ reminder: Reminder) {
      self.imageViewIcon.image = reminder.selectedImage.image
      self.labelReminderTitle.text = reminder.title

      if reminder.completedToday {
        self.accessoryType = .checkmark
      } else {
        self.accessoryType = .disclosureIndicator
      }
    }
    
}
