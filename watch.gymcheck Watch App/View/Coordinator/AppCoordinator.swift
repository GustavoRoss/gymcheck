//
//  AppCoordinator.swift
//  watch.gymcheck Watch App
//
//  Created by Gustavo Henriques on 24/06/23.
//

import Foundation
import Swinject
import SwiftUI

class AppCordinator: ObservableObject {
    let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func makeWorkoutCheckerView(workouts: [Workout] = []) -> some View {
        return WorkoutChecker(
            viewModel: WorkoutCheckerViewModel(
                persistenceController: self.assembler.resolver.resolve(PersistenceController.self)!,
                workoutRepository: self.assembler.resolver.resolve(WorkoutRepository.self)!,
                workouts: workouts
            )
        )
    }
    
    func makeTrainingList() -> some View {
        return TrainingListView(viewModel: self.assembler.resolver.resolve(TrainigListViewModel.self)!)
    }
}
