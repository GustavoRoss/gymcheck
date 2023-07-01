//
//  WorkoutListViewModel.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 17/06/23.
//

import Foundation

class WorkoutListViewModel: BaseViewModel {
    private var workoutRepository: WorkoutRepository
    private var persistenceController: PersistenceController
    
    init(workoutRepository: WorkoutRepository, persistenceController: PersistenceController) {
        self.workoutRepository = workoutRepository
        self.persistenceController = persistenceController
    }
    
    @Published var workouts = [Workout]()
    @Published var selectedWorkoutsList: [Workout] = []
    @Published var selectedWorkouts: Set<ObjectIdentifier> = Set() {
        didSet {
            let ids = Array(selectedWorkouts)
            selectedWorkoutsList = workouts.filter { workout in
                ids.contains(where: { $0 ==  workout.id })
            }
        }
    }

    
    func fetchWorkouts() {
        workoutRepository.getAllWorkout()
            .sink { error in
                debugPrint(error)
            } receiveValue: { workouts in
                self.workouts.removeAll()
                self.workouts.append(contentsOf: workouts)
            }.store(in: &subscriptions)
    }
    
    func onDeleteWorkout(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let currentWorkout = workouts[index]
            persistenceController.context.delete(currentWorkout)
        }
        
        workouts.remove(atOffsets: indexSet)
        _ = persistenceController.save()
    }
}
