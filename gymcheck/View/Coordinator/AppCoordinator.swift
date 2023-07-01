//
//  AppCoordinator.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 23/06/23.
//

import Foundation
import Swinject
import SwiftUI

class AppCordinator: ObservableObject {
    let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func makeWorkoutListView() -> some View {
        WorkoutsList(workoutsViewModel: self.assembler.resolver.resolve(WorkoutListViewModel.self)!)
    }
    
    func makeCreateWorkoutView() -> some View {
        CreateWorkout(viewModel: self.assembler.resolver.resolve(CreateWorkoutViewModel.self)!)
    }
    
    func makeTrainigListView() -> some View {
        TrainingView(viewModel: self.assembler.resolver.resolve(TrainingViewModel.self)!)
    }
    
    func makeCreateTrainingView() -> some View {
        CreateTraining(
            workoutListViewModel: self.assembler.resolver.resolve(WorkoutListViewModel.self)!,
            createTrainingViewModel: self.assembler.resolver.resolve(CreateTrainingViewModel.self)!
        )
    }
    
    func makeTrainingDetailView(training: Training) -> some View {
        TrainingDetail(training: training, viewModel: self.assembler.resolver.resolve(WorkoutListViewModel.self)!)
    }
}
