//
//  ReminderListCell.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 17/08/21.
//

import UIKit


class ReminderListCell: UITableViewCell {
  
  typealias DoneButtonAction = () -> Void //cria um nickname para um tipo
  //encapsulate later
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var dateLabel : UILabel!
  @IBOutlet private var doneButton: UIButton!
  
  private var doneButtonAction: DoneButtonAction?
  
  @IBAction func doneButtonTriggered(_ sender: UIButton) {
    
    doneButtonAction?()
    
  }
  
  func configure(title: String, dateText: String, isDone: Bool, doneButtonAction: @escaping DoneButtonAction) {
    titleLabel.text = title
    dateLabel.text = dateText
    let image = isDone ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
    doneButton.setBackgroundImage(image, for: .normal)
    self.doneButtonAction = doneButtonAction
  }
  
}
