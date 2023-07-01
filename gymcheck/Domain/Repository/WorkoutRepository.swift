//
//  WorkoutRepository.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 24/06/23.
//

import Foundation
import Combine

protocol WorkoutRepository {
    func getAllWorkout() -> AnyPublisher<[Workout], Error>
}
