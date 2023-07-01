//
//  WorkoutRepository.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 17/06/23.
//

import Foundation
import Combine
import CoreData

class WorkoutRepositoryImpl: WorkoutRepository {
    
    private var controller: PersistenceController
    
    init(controller: PersistenceController) {
        self.controller = controller
    }
    
    func getAllWorkout() -> AnyPublisher<[Workout], Error> {
        return controller.fetch(managedObject: Workout.self)
    }
    
}
