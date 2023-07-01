//
//  RepositoryAssembly.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 24/06/23.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PersistenceController.self) { _ in
            PersistenceControllerImpl()
        }.inObjectScope(.container)
        
        container.register(WorkoutRepository.self) { resolver in
            WorkoutRepositoryImpl(controller: resolver.resolve(PersistenceController.self)!)
        }.inObjectScope(.container)
        
        container.register(TrainingRepository.self) { resolver in
            TrainingRepositoryImpl(persistenceController: resolver.resolve(PersistenceController.self)!)
        }.inObjectScope(.container)
    }
}
