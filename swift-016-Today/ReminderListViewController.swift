//
//  ViewController.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 17/08/21.
//

import UIKit

class ReminderListViewController: UITableViewController {
  
  private var reminderListDataSource: ReminderListDataSource?
  
  static let showDetailSegueIdentifier = "ShowReminderDetailSegue"
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Self.showDetailSegueIdentifier,
       let detination = segue.destination as? ReminderDetailViewController,
       let cell = sender as? UITableViewCell,
       let indexPath = tableView.indexPath(for: cell) {
      let reminder = Reminder.testData[indexPath.row]
      detination.configure(with: reminder)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    reminderListDataSource = ReminderListDataSource()
    tableView.dataSource = reminderListDataSource
  }
  
}



