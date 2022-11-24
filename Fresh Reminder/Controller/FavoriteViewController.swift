//
//  FavoriteViewController.swift
//  Fresh Reminder
//
//  Created by macbook on 21/11/2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.cornerRadius = 15
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Optinal Value
        if let favoritedReminder = ReminderService.shared.getFavoriteReminder(){
            titleLabel.text = favoritedReminder.title
            //Date Formatter
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy hh:mma"
            dateLabel.text = dateFormatter.string(from: favoritedReminder.date)
            
        }
    }
    
}
