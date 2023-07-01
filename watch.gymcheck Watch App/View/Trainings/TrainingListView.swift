//
//  TrainingListView.swift
//  watch.gymcheck Watch App
//
//  Created by Gustavo Henriques on 25/06/23.
//

import SwiftUI

struct TrainingListView: View {
    @StateObject var viewModel: TrainigListViewModel
    @EnvironmentObject var coordinator: AppCordinator
    
    var body: some View {
        List(viewModel.trainings) { training in
            NavigationLink {
                coordinator.makeWorkoutCheckerView(workouts: Array(training.workoutList))
            } label: {
                Text(training.formattedTitle)
            }
        }
        .navigationTitle("Trainings")
        .onAppear {
            viewModel.fetchTrainings()
        }
    }
}
