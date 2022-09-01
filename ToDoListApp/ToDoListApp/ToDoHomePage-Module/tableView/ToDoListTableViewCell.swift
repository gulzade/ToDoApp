//
//  ToDoListTableViewCell.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
