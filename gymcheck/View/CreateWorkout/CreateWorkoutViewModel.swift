//
//  CreateWorkoutViewModel.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 23/06/23.
//

import Foundation

class CreateWorkoutViewModel: BaseViewModel {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var repetitionCount: Int = 0
    @Published var seriesCount: Int = 0
    @Published var showAlert: Bool = false
    
    let workoutRepository: WorkoutRepository
    let persistenceController: PersistenceController
    
    init(workoutRepository: WorkoutRepository, persistenceController: PersistenceController) {
        self.workoutRepository = workoutRepository
        self.persistenceController = persistenceController
    }
    
    func saveWorkout() {
        let workout = Workout(context: persistenceController.context)
        workout.name = title
        workout.taskDescription = description
        workout.seriesQtd = Int16(seriesCount)
        workout.repetitions = Int16(repetitionCount)
        
        showAlert = persistenceController.save()
    }
}
