//
//  ReminderListCell.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 17/08/21.
//

import UIKit

class ReminderListCell: UITableViewCell {
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var dateLabel : UILabel!
  @IBOutlet var doneButton: UIButton!
  
  @IBAction func doneButtonTriggered(_ sender: UIButton) {
//    doneButtonAction?()
  }
  
}
