//
//  TrainingViewModel.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 25/06/23.
//

import Foundation

class TrainingViewModel: BaseViewModel {
    let trainingRepository: TrainingRepository
    let persistenceController: PersistenceController
    
    @Published var trainings: [Training] = []
    
    init(
        trainingRepository: TrainingRepository,
        persistenceController: PersistenceController
    ) {
        self.trainingRepository = trainingRepository
        self.persistenceController = persistenceController
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
    
    func deleteTraining(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let element = self.trainings[index]
            persistenceController.context.delete(element)
        }
        
        self.trainings.remove(atOffsets: indexSet)
        _ = persistenceController.save()
    }
}
