//
//  RemindersViewController.swift
//  Fresh Reminder
//
//  Created by macbook on 21/11/2022.
//

import UIKit

class RemindersViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderService.shared.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Dequeue the cell from reuse pool
        let cell = tableView.dequeueReusableCell(withIdentifier: "addReminder") as! ReminderTableViewCell
        
        //Get the reminder from the given index path
        let reminder = ReminderService.shared.getReminder(index: indexPath.row)
        
        //Update the cell base on the reminder object
        cell.updateCell(reminder: reminder)
        
        //Return cell
        return cell
    }
    

}
