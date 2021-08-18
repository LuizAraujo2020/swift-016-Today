//
//  EditTitleCell.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 18/08/21.
//

import UIKit

class EditTitleCell: UITableViewCell {
  
  @IBOutlet var titleTextFiled: UITextField!
  
  func configure(title: String) {
    titleTextFiled.text = title
  }
  
}
