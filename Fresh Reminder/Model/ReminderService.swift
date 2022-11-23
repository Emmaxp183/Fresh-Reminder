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
    //Created a shared url
    var url:URL
    private init(){
        url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        url.appendPathComponent("reminder.jason")
        load()
    }
    
    //Saving an array of reminders
    func save(){
        do{
            let encoder = JSONEncoder()
            let data = try encoder.encode(reminders)
            try data.write(to: url)
        }catch{
            print("error\(error.localizedDescription)")
        }
    }
    
    //Loaded the data from the url and added to array
    func load(){
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            reminders = try decoder.decode([Reminder].self, from: data)
        }catch{
            print("error \(error.localizedDescription)")
        }
    }
    
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
        
        save()
        
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
        save()
    }
    
    //Get list of reminder
    func getListOfReminders() -> [Reminder]{
        return reminders
    }
    
    //Delete a reminder
    func deleteReminder(index: Int){
        reminders.remove(at: index)
        save()
    }
    
    //Get the favorite reminder
    func getFavoriteReminder() -> Reminder?{
        return reminders.first
    }
    
    
}
