//
//  Reminder.swift
//  Fresh Reminder
//
//  Created by macbook on 21/11/2022.
//

import Foundation


class Reminder:Codable {
    var title: String
    var date: Date
    var isCompleted:Bool
    
    init(title: String, date: Date, isCompleted: Bool) {
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
}
