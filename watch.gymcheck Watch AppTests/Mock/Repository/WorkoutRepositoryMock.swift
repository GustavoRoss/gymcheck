//
//  WorkoutRepositoryMock.swift
//  watch.gymcheck Watch AppTests
//
//  Created by Gustavo Henriques on 26/06/23.
//

import Foundation
@testable import Gym_Check
import Combine
class WorkoutRepositoryMock: WorkoutRepository {
    func getAllWorkout() -> AnyPublisher<[Gym_Check.Workout], Error> {
        return Empty(completeImmediately: true).eraseToAnyPublisher()
    }
}
