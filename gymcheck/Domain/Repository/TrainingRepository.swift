//
//  TrainingRepository.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import Foundation
import Combine

protocol TrainingRepository {
    func getTrainings() -> AnyPublisher<[Training], Error>
}
