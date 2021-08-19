/*
 See LICENSE folder for this sample's licensing information.
 */

import UIKit

class ReminderListDataSource: NSObject {
    private lazy var dateFormatter = RelativeDateTimeFormatter()
    
    func update(_ reminder: Reminder, at row: Int) {
        Reminder.testData[row] = reminder
    }
    
    func reminder(at row: Int) -> Reminder {
        return Reminder.testData[row]
    }
  
    func add(_ reminder: Reminder) {
      Reminder.testData.insert(reminder, at: 0)
    }

}

extension ReminderListDataSource: UITableViewDataSource {
    static let reminderListCellIdentifier = "ReminderListCell"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath)
                as? ReminderListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        let currentReminder = reminder(at: indexPath.row)
        let dateText = dateFormatter.localizedString(for: currentReminder.dueDate, relativeTo: Date())
        cell.configure(title: currentReminder.title, dateText: dateText, isDone: currentReminder.isComplete) {
            var modifiedReminder = currentReminder
            modifiedReminder.isComplete.toggle()
            self.update(modifiedReminder, at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }
}
