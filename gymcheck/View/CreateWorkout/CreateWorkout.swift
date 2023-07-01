//
//  CreateWorkout.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 23/06/23.
//

import Foundation
import SwiftUI

struct CreateWorkout: View {
    @StateObject var viewModel: CreateWorkoutViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Title", text: $viewModel.title)
                .textFieldStyle(.roundedBorder)
                .padding(
                    EdgeInsets(top: 17, leading: 17, bottom: 0, trailing: 17)
                )
            
            TextField("Description", text: $viewModel.description, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding(
                    EdgeInsets(top: 8, leading: 17, bottom: 0, trailing: 17)
                )
                .lineLimit(3, reservesSpace: true)
            HStack {
                VStack {
                    Text("Series")
                    Picker("", selection: $viewModel.seriesCount) {
                        ForEach(1...4, id: \.self) { number in
                            Text("\(number)")
                        }
                    }.pickerStyle(.wheel)
                }
                VStack {
                    Text("Repetitions")
                    Picker("", selection: $viewModel.repetitionCount) {
                        ForEach(1...20, id: \.self) { number in
                            Text("\(number)")
                        }
                    }.pickerStyle(.wheel)
                }
            }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            Button {
                viewModel.saveWorkout()
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
        .navigationTitle("Create New Workout")
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Success"),
                message: Text("Workout created successfully"),
                dismissButton: .default(Text("OK"), action: {
                    presentationMode.wrappedValue.dismiss()
                })
            )
        }
    }
}


struct CreateWorkout_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkout(viewModel: CreateWorkoutViewModel(
            workoutRepository: WorkoutRepositoryImpl(controller: PersistenceControllerImpl()),
            persistenceController: PersistenceControllerImpl()
        ))
    }
}
