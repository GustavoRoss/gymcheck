//
//  CreateTrainingViewModel.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import Foundation

class CreateTrainingViewModel: BaseViewModel {
    let persistenceController: PersistenceController

    @Published var title: String = ""
    @Published var weekDay: Int = 1
    @Published var trainingCreated: Bool = false
    var workouts: [Workout] = []
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    func createTraining() {
        let training = Training(context: persistenceController.context)
        training.name = title
        training.weekDay = Int16(weekDay)
        
        workouts.forEach { workout in
            training.addToWorkouts(workout)
        }
    
        trainingCreated = persistenceController.save()
    }
}
