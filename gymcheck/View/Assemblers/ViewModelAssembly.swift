//
//  ViewModelAssembly.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 23/06/23.
//

import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(WorkoutListViewModel.self) { r in
            WorkoutListViewModel(
                workoutRepository: r.resolve(WorkoutRepository.self)!,
                persistenceController: r.resolve(PersistenceController.self)!
            )
        }
        
        container.register(CreateWorkoutViewModel.self) { r in
            CreateWorkoutViewModel(
                workoutRepository: r.resolve(WorkoutRepository.self)!,
                persistenceController: r.resolve(PersistenceController.self)!
            )
        }
        
        container.register(TrainingViewModel.self) { resolver in
            TrainingViewModel(
                trainingRepository: resolver.resolve(TrainingRepository.self)!,
                persistenceController: resolver.resolve(PersistenceController.self)!
            )
        }

        container.register(CreateTrainingViewModel.self) { resolver in
            CreateTrainingViewModel(persistenceController: resolver.resolve(PersistenceController.self)!)
        }
    }
}
