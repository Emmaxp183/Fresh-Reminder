//
//  NewReminderViewController.swift
//  Fresh Reminder
//
//  Created by macbook on 22/11/2022.
//

import UIKit

class NewReminderViewController: UIViewController {

    @IBOutlet weak var datePiker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var completedSwitch: UISwitch!
    


    @IBAction func SaveButton(_ sender: UIButton) {
       //Create new reminder
        let reminder = Reminder(title: titleTextField.text!, date: datePiker.date, isCompleted: completedSwitch.isOn)
        //Sevices
        ReminderService.shared.create(reminder: reminder)
        //Dissmissing the view
        navigationController!.popViewController(animated: true)
        
        
    }
}
