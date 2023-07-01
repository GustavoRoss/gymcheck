//
//  PersistenceControllerMock.swift
//  watch.gymcheck Watch AppTests
//
//  Created by Gustavo Henriques on 26/06/23.
//

import Foundation
@testable import Gym_Check
import Combine
import CoreData

class PersistenceControllerMock: PersistenceController {
    var context: NSManagedObjectContext = PersistenceControllerImpl(inMemory: true).context
    
    func save() -> Bool {
        return true
    }
    
    func fetch<T>(managedObject: T.Type) -> AnyPublisher<[T], Error> where T : NSManagedObject {
        return Empty(completeImmediately: true).eraseToAnyPublisher()
    }
    
}
