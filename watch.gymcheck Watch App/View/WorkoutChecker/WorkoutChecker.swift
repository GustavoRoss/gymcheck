//
//  WorkoutChecker.swift
//  watch.gymcheck Watch App
//
//  Created by Gustavo Henriques on 24/06/23.
//

import SwiftUI

struct WorkoutChecker: View {
    @StateObject var viewModel: WorkoutCheckerViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.currentWorkout?.name ?? "")
                    .font(.title3)
                
                Text(viewModel.currentWorkout?.taskDescription ?? "")
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                    .font(.body)
                HStack {
                    ZStack {
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 24, height: 24, alignment: .center)
                        Text(String(viewModel.currentWorkout?.seriesQtd ?? 0))
                    }
                    ZStack {
                        Circle()
                            .foregroundColor(.orange)
                            .frame(width: 24, height: 24, alignment: .center)
                        Text(String(viewModel.currentWorkout?.repetitions ?? 0))
                    }
                }
                Button {
                    viewModel.goToNextWorkout()
                } label: {
                    Text("Next")
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))

            }
        }
    }
}
