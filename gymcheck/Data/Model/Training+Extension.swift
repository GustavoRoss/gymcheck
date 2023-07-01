//
//  Training+Extension.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import Foundation

extension Training {
    var weekDayName: String? {
        Calendar.current.getWeekName(weekDayNumber: Int(self.weekDay))
    }
    
    var workoutList: [Workout] {
        self.workouts?.allObjects.compactMap { $0 as? Workout } ?? []
    }
    
    var formattedTitle: String {
        return "(\(self.weekDayName ?? "")) - \(self.name ?? "")"
    }
}
