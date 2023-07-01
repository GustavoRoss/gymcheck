//
//  CreateTraining.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import SwiftUI

struct CreateTraining: View {
    @StateObject var workoutListViewModel: WorkoutListViewModel
    @StateObject var createTrainingViewModel: CreateTrainingViewModel
    
    @State var isPresentingBottomSheet = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack {
                TextField("Title", text: $createTrainingViewModel.title)
                    .textFieldStyle(.roundedBorder)
                HStack {
                    Text("Week Day")
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                    Picker("", selection: $createTrainingViewModel.weekDay) {
                        ForEach(1...7, id: \.self) { week in
                            Text(Calendar.current.getWeekName(weekDayNumber: week) ?? "")
                        }
                    }
                    .pickerStyle(.menu)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .padding()
            
            List(workoutListViewModel.selectedWorkoutsList) { workout in
                WorkoutListItemView(workout: workout)
            }
            Button {
                createTrainingViewModel.createTraining()
            } label: {
                Spacer()
                Text("Create")
                    .padding()
                    .foregroundColor(.white)
                    .bold()
                Spacer()
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .padding()
        }
        .navigationTitle("Create Training")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isPresentingBottomSheet = true
                }, label: {
                    Text("Add Workouts")
                })
            }
        }
        .sheet(isPresented: $isPresentingBottomSheet, onDismiss: {
            createTrainingViewModel.workouts = workoutListViewModel.selectedWorkoutsList
        }) {
            WorkoutPickerBottomSheetView(viewModel: workoutListViewModel)
        }
        .onAppear {
            workoutListViewModel.fetchWorkouts()
        }
        .alert(isPresented: $createTrainingViewModel.trainingCreated) {
            Alert(
                title: Text("Success"),
                message: Text("Training created successfully"),
                dismissButton: .default(Text("OK"), action: {
                    presentationMode.wrappedValue.dismiss()
                })
            )
        }
    }
}
