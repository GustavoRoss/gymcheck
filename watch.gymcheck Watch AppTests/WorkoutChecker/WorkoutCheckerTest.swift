//
//  WorkoutCheckerTest.swift
//  watch.gymcheck Watch AppTests
//
//  Created by Gustavo Henriques on 26/06/23.
//

import Foundation
@testable import Gym_Check
import XCTest

class WorkoutCheckerTest: XCTestCase {
    private var viewModel: WorkoutCheckerViewModel!
    
    override func setUp() {
        let workouts = [Workout(), Workout(), Workout(), Workout()]
        
        self.viewModel = WorkoutCheckerViewModel(
            persistenceController: PersistenceControllerMock(), workoutRepository: WorkoutRepositoryMock(), workouts: workouts)
    }
    
    override func tearDown() {
        self.viewModel = nil
    }
    
    func canCheckAllWorkoutList() {
        self.viewModel.goToNextWorkout()
        self.viewModel.goToNextWorkout()
        self.viewModel.goToNextWorkout()
        self.viewModel.goToNextWorkout()
        
        XCTAssertEqual(self.viewModel.currentIndex, 3, "Should complete 4 workouts")
    }
}
