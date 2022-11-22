//
//  ReminderService.swift
//  Fresh Reminder
//
//  Created by macbook on 21/11/2022.
//

import Foundation


class ReminderService{
    //Shared properties
    static let shared = ReminderService()
    //Properties
    private var reminders = [Reminder]()
    
    // Create a reminder
    func create(reminder: Reminder){
        //Add reminder to an array in a sorted order
        var indexToInsert:Int?
        for (index,element) in reminders.enumerated(){
            if element.date.timeIntervalSince1970 > reminder.date.timeIntervalSince1970{
                indexToInsert = index
                break
            }
        }
    //I need to use indexToInsert
        if let indexToInsert = indexToInsert{
            reminders.insert(reminder, at: indexToInsert)
            
        }else{
    //Appending it to the end of the array
            reminders.append(reminder)
        }
        
    }
    
    //Upadet reminder
    func update(reminder: Reminder , index: Int){
        reminders[index] = reminder
    }
    
    //Get number of reminder
    func getCount() -> Int{
        return reminders.count
    }
    
    //Get a specific reminder
    func getReminder(index: Int) -> Reminder{
        return reminders[index]
    }
    
    //Toggel completed status
    func toggleCompleted(index: Int){
        let reminder = getReminder(index: index)
        reminder.isCompleted = !reminder.isCompleted
    }
    
    //Get list of reminder
    func getListOfReminders() -> [Reminder]{
        return reminders
    }
    
    //Delete a reminder
    func deleteReminder(index: Int){
        reminders.remove(at: index)
    }
    
    //Get the favorite reminder
    func getFavoriteReminder() -> Reminder?{
        return reminders.first
    }
    
    
}
