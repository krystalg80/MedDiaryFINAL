//
//  RemindersViewController.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/1/23.
//

import UIKit

class RemindersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var persistence = PersistenceLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        tableView.delegate = self
        tableView.dataSource = self
      
        tableView.register(
          ReminderTableViewCell.nib,
          forCellReuseIdentifier: ReminderTableViewCell.identifier
        )
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.reminders.count // Change!
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      switch editingStyle {
      case.delete:
          let reminderToDelete = persistence.reminders[indexPath.row]
          let reminderIndexToDelete = indexPath.row
          // Create an instance of UIAlertController
          let deleteAlert = UIAlertController(reminderTitle: reminderToDelete.title) {
            // The alert is confirmed delete the habit
            self.persistence.delete(reminderIndexToDelete)
            tableView.deleteRows(at: [indexPath], with: .automatic)
          }
          // Show the Alert Controller
          self.present(deleteAlert, animated: true)
        // handling the delete action
      default:
        break
          
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
           withIdentifier: ReminderTableViewCell.identifier,
           for: indexPath
         ) as! ReminderTableViewCell
        let reminder = persistence.reminders[indexPath.row]
          cell.configure(reminder) // Shows an error, you'll fix this next!

        // corner radius ?
        cell.imageViewIcon.layer.cornerRadius = cell.imageViewIcon.frame.height / 2
        
         return cell
       }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        persistence.setNeedsToReloadReminders()
        tableView.reloadData()
    }

}
extension RemindersViewController {
    
    func setupNavBar() {
        title = "Reminders" // Add a title to the nav bar
        // Create a UIBarButtonItem
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddReminder(_:)))
        // Add the barbuttonitem to the navbar
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // This function handle taps on the bar button item, see #selector above
    @objc func pressAddReminder(_ sender: UIBarButtonItem) {
        let addReminderVC = AddReminderViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: addReminderVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
extension UIAlertController {
      convenience init(reminderTitle: String, comfirmHandler: @escaping () -> Void) {
        self.init(title: "Delete Reminder", message: "Are you sure you want to delete \(reminderTitle)?", preferredStyle: .actionSheet)

        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { _ in
          comfirmHandler()
        }
        self.addAction(confirmAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        self.addAction(cancelAction)
      }
    }

