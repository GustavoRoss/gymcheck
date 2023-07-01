//
//  Calendar+Extensions.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import Foundation

extension Calendar {
    var weekDayNumber: Int {
        get {
            let currentDate = Date()
            let weekDayNumber = self.component(.weekday, from: currentDate)
            return weekDayNumber
        }
    }
    
    func getWeekName(weekDayNumber: Int) -> String? {
        guard weekDayNumber >= 1 && weekDayNumber <= 7 else {
            return nil
        }
        
        let adjustedWeekDayNumber = weekDayNumber - 1
        
        return self.weekdaySymbols[adjustedWeekDayNumber]
    }
}
