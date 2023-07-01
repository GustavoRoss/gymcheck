//
//  Training.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import SwiftUI

struct TrainingView: View {
    @StateObject var viewModel: TrainingViewModel
    @EnvironmentObject var coordinator: AppCordinator
    @State var oneActive: Bool = false
    @State var twoActive: Bool = false
    
    var body: some View {
        List {
            ForEach(viewModel.trainings) { training in
                NavigationLink {
                    coordinator.makeTrainingDetailView(training: training)
                } label: {
                    Text(training.name ?? "")
                }
            }.onDelete { indexSet in
                viewModel.deleteTraining(indexSet)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        oneActive = true
                    } label: {
                        Text("Manage Workouts")
                    }
                    
                    Button {
                        twoActive = true
                    } label: {
                        Text("New Training")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .navigationDestination(isPresented: $oneActive) {
            coordinator.makeWorkoutListView()
        }
        .navigationDestination(isPresented: $twoActive) {
            coordinator.makeCreateTrainingView()
        }
        .navigationTitle("My Trainings")
        .onAppear {
            viewModel.fetchTrainings()
        }
    }
}
