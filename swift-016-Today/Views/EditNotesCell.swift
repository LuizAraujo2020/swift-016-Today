//
//  EditNotesCell.swift
//  swift-016-Today
//
//  Created by Luiz Carlos da Silva Araujo on 18/08/21.
//

import UIKit

class EditNotesCell: UITableViewCell {
  
  @IBOutlet var notesTextView: UITextView!
  
  func configure(notes: String) {
    notesTextView.text = notes
  }
}
