//
//  ViewModelAssembly.swift
//  watch.gymcheck Watch App
//
//  Created by Gustavo Henriques on 24/06/23.
//

import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TrainigListViewModel.self) { r in
            TrainigListViewModel(trainingRepository: r.resolve(TrainingRepository.self)!)
        }
    }
}
