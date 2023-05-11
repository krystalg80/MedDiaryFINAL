//
//  ConfirmReminderViewController.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/10/23.
//

import UIKit

class ConfirmReminderViewController: UIViewController {
        var reminderImage: Reminder.Images!
    
    @IBOutlet weak var reminderImageView: UIImageView!
    @IBOutlet weak var reminderNameInputField: UITextField!
    @IBAction func createReminderButtonPressed(_ sender: Any) {
        var persistenceLayer = PersistenceLayer()
            guard let reminderText = reminderNameInputField.text else { return }
            
            persistenceLayer.createNewReminder(name: reminderText, image: reminderImage)
            self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    private func updateUI() {
        title = "New Reminder"
        reminderImageView.image = reminderImage.image
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
}



   


