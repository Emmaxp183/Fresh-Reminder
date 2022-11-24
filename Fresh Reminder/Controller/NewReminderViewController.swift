//
//  NewReminderViewController.swift
//  Fresh Reminder
//
//  Created by macbook on 22/11/2022.
//

import UIKit

class NewReminderViewController: UIViewController {
    //Key to get acces the data
    var reminderIndex:Int?
    @IBOutlet weak var datePiker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if the reminder exites porpulate the data into the outlets
        if let reminderIndex = reminderIndex{
            let reminder = ReminderService.shared.getReminder(index: reminderIndex)
            titleTextField.text = reminder.title
            datePiker.date = reminder.date
            completedSwitch.isOn = reminder.isCompleted
        }
    }
    
    @IBAction func SaveButton(_ sender: UIButton) {
        //Create new reminder
        let reminder = Reminder(title: titleTextField.text!, date: datePiker.date, isCompleted: completedSwitch.isOn)
        
        //Upade a reminder else create new reminder
        if let reminderIndex = reminderIndex {
            ReminderService.shared.update(reminder: reminder, index: reminderIndex)
        }else{
            ReminderService.shared.create(reminder: reminder)
        }
        //Dissmissing the view
        navigationController!.popViewController(animated: true)
    }
}
