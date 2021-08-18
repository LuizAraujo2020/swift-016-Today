//
//  ViewController.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 17/08/21.
//

import UIKit

class ReminderListViewController: UITableViewController {
  
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

}

extension ReminderListViewController {
  
  static let reminderListCellIdentifier = "ReminderListCell"

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Reminder.testData.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
      fatalError("Unable to dequeue ReminderCell")
    }
    
    let reminder = Reminder.testData[indexPath.row]
    
    cell.configure(title: reminder.title, dateText: reminder.dueDate.description, isDone: reminder.isComplete) {
      Reminder.testData[indexPath.row].isComplete.toggle()
      tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    return cell
  }
  
}
