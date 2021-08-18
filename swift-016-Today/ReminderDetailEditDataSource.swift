//
//  ReminderDetailEditDataSource.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 18/08/21.
//

import UIKit

class ReminderDetailEditDataSource: NSObject {
  
  enum ReminderSection: Int, CaseIterable {
    case title
    case dueDate
    case notes
    
    var displayText: String {
      switch self {
        case .title:
          return "Title"
        case .dueDate:
          return "Date"
        case .notes:
          return "Notes"
      }
    }
    
    func cellIdentifier(for row: Int) -> String {
      switch self {
        case .title:
          return "EditTitleCell"
        case .dueDate:
          return row == 0 ? "EditDateLabelCell" : "EditDateCell"
        case .notes:
          return "EditNotesCell"
      }
    }
    
  }
  
}
