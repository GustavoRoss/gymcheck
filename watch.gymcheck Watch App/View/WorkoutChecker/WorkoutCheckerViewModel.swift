//
//  WorkoutCheckerViewModel.swift
//  watch.gymcheck Watch App
//
//  Created by Gustavo Henriques on 24/06/23.
//

import Foundation

class WorkoutCheckerViewModel: BaseViewModel {
    private let persistenceController: PersistenceController
    private let workoutRepository: WorkoutRepository
    
    private var allWorkouts: [Workout] = []
    private(set) var currentIndex: Int = -1
    
    @Published var currentWorkout: Workout?
    
    init(
        persistenceController: PersistenceController,
        workoutRepository: WorkoutRepository,
        workouts: [Workout]
    ) {
        self.persistenceController = persistenceController
        self.workoutRepository = workoutRepository
        self.allWorkouts = workouts
        super.init()
        goToNextWorkout()
    }
    
    func goToNextWorkout() {
        currentIndex += 1
        
        if currentIndex < allWorkouts.count {
            self.currentWorkout = allWorkouts[currentIndex]
        }
    }
}
