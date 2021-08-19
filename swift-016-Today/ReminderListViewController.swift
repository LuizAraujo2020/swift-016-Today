//
//  ViewController.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 17/08/21.
//

import UIKit

class ReminderListViewController: UITableViewController {
  static let showDetailSegueIdentifier = "ShowReminderDetailSegue"
  static let mainStoryboardName = "Main"
  static let detailViewControllerIdentifier = "ReminderDetailViewController"
  
  private var reminderListDataSource: ReminderListDataSource?
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Self.showDetailSegueIdentifier,
       let destination = segue.destination as? ReminderDetailViewController,
       let cell = sender as? UITableViewCell,
       let indexPath = tableView.indexPath(for: cell) {
      let rowIndex = indexPath.row
      guard let reminder = reminderListDataSource?.reminder(at: rowIndex) else {
        fatalError("Couldn't find data source for reminder list.")
      }
      destination.configure(with: reminder) { reminder in
        self.reminderListDataSource?.update(reminder, at: rowIndex)
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    reminderListDataSource = ReminderListDataSource()
    tableView.dataSource = reminderListDataSource
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if let navigationController = navigationController,
       navigationController.isToolbarHidden {
      navigationController.setToolbarHidden(false, animated: animated)
    }
  }
  
  @IBAction func addButtonTriggered(_ sender: UIBarButtonItem) {
    addReminder()
  }
  
  private func addReminder() {
    // Instantiate Main.storyboard.
    let storyboard = UIStoryboard(name: Self.mainStoryboardName, bundle: nil)
    //Create a ReminderDetailViewController instance.
    let detailViewController: ReminderDetailViewController = storyboard.instantiateViewController(identifier: Self.detailViewControllerIdentifier)
    let reminder = Reminder(title: "New Reminder", dueDate: Date())
    detailViewController.configure(with: reminder) { reminder in
      
    }
    let navigationController = UINavigationController(rootViewController: detailViewController)
    present(navigationController, animated: true, completion: nil)
    
    
  }
  
}
