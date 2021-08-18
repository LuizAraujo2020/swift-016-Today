//
//  ReminderListCell.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 17/08/21.
//

import UIKit


class ReminderListCell: UITableViewCell {
  
  typealias DoneButtonAction = () -> Void //cria um nickname para um tipo
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var dateLabel : UILabel!
  @IBOutlet var doneButton: UIButton!
  
  var doneButtonAction: DoneButtonAction?
  
  @IBAction func doneButtonTriggered(_ sender: UIButton) {
    
    doneButtonAction?()
    
  }
  
}
