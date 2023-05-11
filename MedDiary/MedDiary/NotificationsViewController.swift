//
//  NotificationsViewController.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/7/23.
//
import UserNotifications
import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet var allowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
    }
    

    @IBAction func allowNotification(_ sender: Any) {
        // fire test notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound],completionHandler: {success, error in
            if success {
                // schedule test
            }
            else if error != nil {
                    print("error occured")
                }
            })
                                                               
                }
    }
    


  
    


