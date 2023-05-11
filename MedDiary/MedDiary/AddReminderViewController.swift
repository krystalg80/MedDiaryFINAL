//
//  AddReminderViewController.swift
//  MedDiary
//
//  Created by Krystal Galdamez on 5/9/23.
//

import UIKit

class AddReminderViewController: UIViewController {
    
    var selectedIndexPath: IndexPath? {
        didSet {
            var indexPaths: [IndexPath] = []
            if let selectedIndexPath = selectedIndexPath {
                indexPaths.append(selectedIndexPath)
            }
            if let oldValue = oldValue {
                indexPaths.append(oldValue)
            }
            collectionView.performBatchUpdates({
                self.collectionView.reloadItems(at: indexPaths)
            })
        }
    }
    
    let reminderImages = Reminder.Images.allCases
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func pickPhotoButtonPressed(_ sender: Any) {
        guard let selectedIndexPath = selectedIndexPath else { return }
            
            let confirmReminderVC = ConfirmReminderViewController.instantiate()
            confirmReminderVC.reminderImage = reminderImages[selectedIndexPath.row]
            navigationController?.pushViewController(confirmReminderVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ReminderImageCollectionViewCell.nib, forCellWithReuseIdentifier: ReminderImageCollectionViewCell.identifier)
        
        setupNavBar()
    }
    func setupNavBar() {
        title = "Select Image"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddReminder(_:)))
        navigationItem.leftBarButtonItem = cancelButton
    }
    @objc func cancelAddReminder(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
extension AddReminderViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reminderImages.count // <- add this
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReminderImageCollectionViewCell.identifier, for: indexPath) as! ReminderImageCollectionViewCell
            if indexPath == selectedIndexPath{
                cell.setImage(image: reminderImages[indexPath.row].image, withSelection: true)
            }else{
                cell.setImage(image: reminderImages[indexPath.row].image, withSelection: false)
            }
            return cell
        // to here!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/4, height: collectionViewWidth/4)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if selectedIndexPath == indexPath {
               selectedIndexPath = nil
           } else {
               selectedIndexPath = indexPath
           }
           return false
    }
    
    
    
}

    
    // Extension code here...

