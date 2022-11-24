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
    @IBOutlet weak var infoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 15
    }
    
    
    func updateCell(reminder:Reminder, index: Int){
        infoButton.tag = index
        isCompletedView.layer.cornerRadius = isCompletedView.frame.size.width / 2.0
        isCompletedView.layer.borderColor = UIColor.blue.cgColor
        titleLabel.text = reminder.title
        //Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy hh:mma"
        dateLabel.text = dateFormatter.string(from: reminder.date)
        
        if reminder.isCompleted{
            isCompletedView.backgroundColor = UIColor.blue
            isCompletedView.layer.borderWidth = 0.0
            
        } else {
            isCompletedView.backgroundColor = UIColor.white
            isCompletedView.layer.borderWidth = 10.0
        }
    }

}
