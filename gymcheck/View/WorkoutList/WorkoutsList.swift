//
//  WorkoutsList.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 16/06/23.
//

import SwiftUI
import Swinject

struct WorkoutsList: View {

    @StateObject var workoutsViewModel: WorkoutListViewModel
    @EnvironmentObject var coordinator: AppCordinator
    
    var body: some View {
        VStack {
            List {
                ForEach(workoutsViewModel.workouts) { workout in
                    WorkoutListItemView(workout: workout)
                }.onDelete { index in
                    workoutsViewModel.onDeleteWorkout(index)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: {
                    coordinator.makeCreateWorkoutView()
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
        .navigationTitle("Workouts")
        .onAppear {
            workoutsViewModel.fetchWorkouts()
        }
    }
}
