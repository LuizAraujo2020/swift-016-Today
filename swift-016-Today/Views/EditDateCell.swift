//
//  EditDateCell.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 18/08/21.
//

import UIKit

class EditDateCell: UITableViewCell {
  
  @IBOutlet var datePicker: UIDatePicker!
  
  func configure(date: Date) {
    datePicker.date = date
  }
  
}
