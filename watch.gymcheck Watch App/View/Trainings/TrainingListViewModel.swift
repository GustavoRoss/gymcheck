//
//  TrainingListViewModel.swift
//  watch.gymcheck Watch App
//
//  Created by Gustavo Henriques on 25/06/23.
//

import Foundation

class TrainigListViewModel: BaseViewModel {
    
    let trainingRepository: TrainingRepository
    @Published var trainings: [Training] = []
    
    init(trainingRepository: TrainingRepository) {
        self.trainingRepository = trainingRepository
    }
    
    func fetchTrainings() {
        trainingRepository.getTrainings()
            .sink { error in
                debugPrint(error)
            } receiveValue: { trainings in
                self.trainings.removeAll()
                self.trainings.append(contentsOf: trainings)
            }.store(in: &subscriptions)
    }
    
}
