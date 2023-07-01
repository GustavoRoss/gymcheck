//
//  WorkoutListItemView.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import SwiftUI

struct WorkoutListItemView: View {
    let workout: Workout
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(workout.name ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(workout.taskDescription ?? "")
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            }
            Spacer()
            ZStack {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 24, height: 24, alignment: .center)
                Text(String(workout.seriesQtd))
            }
            ZStack {
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 24, height: 24, alignment: .center)
                Text(String(workout.repetitions))
            }
        }
    }
}
