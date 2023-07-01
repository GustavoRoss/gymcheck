//
//  TrainingDetailRepository.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import Foundation
import SwiftUI

struct TrainingDetail: View {
    let training: Training
    
    @StateObject var viewModel: WorkoutListViewModel
    @State var presentBottomSheet: Bool = false
    
    var body: some View {
        VStack {
            List {
                ForEach(training.workoutList) { workout in
                    WorkoutListItemView(workout: workout)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    presentBottomSheet = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
        .navigationTitle(training.formattedTitle)
        .sheet(isPresented: $presentBottomSheet) {
            WorkoutPickerBottomSheetView(viewModel: viewModel)
        }
    }
}

