//
//  MainViewController.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 4/26/23.
//
//
//import UIKit

//class RemindersTableViewController: UITableViewController {

    //var reminders: [reminder] = [reminder(title: "Go to bed before 10pm"),
            //                     reminder(title: "Drink 8 Glasses of Water"),
              //                   reminder(title: "Commit Today"),
                //                 reminder(title: "Stand up every Hour")
                  //               ]
    
  //  override func viewDidLoad() {
    //    super.viewDidLoad()
      //  setupNavBar() // Call the new method
        //}
  //  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return reminders.count
        //}
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> //UITableViewCell {
      //  var cell: UITableViewCell
        //if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
          //      cell = dequeueCell
            //} else {
              //  cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
 //           }
   //         let reminder = reminders[indexPath.row]
     //   cell.textLabel?.text = reminder.title
     
       // return cell
        //}
       //  Do any additional setup after loading the view.
   // }

 //Add the extension
//extension RemindersTableViewController {
  //  func setupNavBar() {
    //    title = "Log your medicine here!" // Add a title to the nav bar
      //   Create a UIBarButtonItem
      //  let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddReminder(_:)))
     //    Add the barbuttonitem to the navbar
  //      navigationItem.rightBarButtonItem = addButton
    //}

  //   This function handle taps on the bar button item, see #selector above
//    @objc func pressAddReminder(_ sender: UIBarButtonItem) {
  //      reminders.insert(reminder(title: "Insert Medicine"), at: 0) // add a new habit
    //       let topIndexPath = IndexPath(row: 0, section: 0)
      //     tableView.insertRows(at: [topIndexPath], with: .automatic)
  //  }
//}


