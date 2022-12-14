//
//  RemindersViewController.swift
//  Fresh Reminder
//
//  Created by macbook on 21/11/2022.
//

import UIKit

class RemindersViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
     //Properties
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableview: UITableView!
   
    //Refreshing my tabel view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noCellImage()
        tableview.reloadData()
    }
    
    func noCellImage(){
        if (ReminderService.shared.getCount() == 0){
            tableview.backgroundView = emptyView
        }else{
            tableview.backgroundView = nil
        }
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        if tableview.isEditing{
            tableview.isEditing = false
            sender.title = "Edit"
        }else{
            tableview.isEditing = true
            sender.title = "Done"
        }
    }
    
    //Delete tabelview row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //if user wants to delete a cell
        if editingStyle == .delete {
            ReminderService.shared.deleteReminder(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ReminderService.shared.toggleCompleted(index: indexPath.row)
        tableview.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderService.shared.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Dequeue the cell from reuse pool
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell") as! ReminderTableViewCell
        
        //Get the reminder from the given index path
        let reminder = ReminderService.shared.getReminder(index: indexPath.row)
        
        //Update the cell base on the reminder object
        cell.updateCell(reminder: reminder, index: indexPath.row)
        
        //Return cell
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateSegue", let newReminderViewController = segue.destination as? NewReminderViewController, let infoButton = sender as? UIButton{
            newReminderViewController.reminderIndex = infoButton.tag
            
        }
    }

}
