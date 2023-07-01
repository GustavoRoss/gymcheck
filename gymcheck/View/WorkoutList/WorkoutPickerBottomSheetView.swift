//
//  WorkoutPickerBottomSheetView.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import SwiftUI

struct WorkoutPickerBottomSheetView: View {
    @StateObject var viewModel: WorkoutListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            List(viewModel.workouts, id: \.id, selection: $viewModel.selectedWorkouts) { workout in
                WorkoutListItemView(workout: workout)
            }
            .environment(\.editMode, .constant(EditMode.active))
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Spacer()
                Text("Done")
                    .padding()
                    .foregroundColor(.white)
                    .bold()
                Spacer()
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .padding()
        }
    }
}
