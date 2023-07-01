//
//  TrainingRepository.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import Foundation
import Combine

struct TrainingRepositoryImpl: TrainingRepository {
    let persistenceController: PersistenceController
    
    func getTrainings() -> AnyPublisher<[Training], Error> {
        return persistenceController.fetch(managedObject: Training.self)
    }
}
