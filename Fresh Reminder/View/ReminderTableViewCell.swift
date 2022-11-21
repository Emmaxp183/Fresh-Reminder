//
//  ReminderTableViewCell.swift
//  Fresh Reminder
//
//  Created by macbook on 21/11/2022.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var isCompletedView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 15
        
    }
    func updateCell(reminder:Reminder){
        titleLabel.text = reminder.title
        //Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yy hh:mma"
        dateLabel.text = dateFormatter.string(from: reminder.date)
        
        if reminder.isCompleted{
            isCompletedView.backgroundColor = UIColor.gray
        } else {
            isCompletedView.backgroundColor = UIColor.white
        }
    }

}
