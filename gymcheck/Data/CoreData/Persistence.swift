//
//  Persistence.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 09/06/23.
//

import CoreData
import Combine
import CloudKit

protocol PersistenceController {
    var context: NSManagedObjectContext { get }
    func save() -> Bool
    func fetch<T: NSManagedObject>(managedObject: T.Type) -> AnyPublisher<[T], Error>
}

struct PersistenceControllerImpl: PersistenceController {
    
    let container: NSPersistentCloudKitContainer
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "gymcheck")
        if inMemory {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: "/dev/null")
            container.persistentStoreDescriptions = [description]
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Failed to load persistent stores: \(error)")
            }
        })
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func save() -> Bool {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                debugPrint(nserror)
                return false
            }
            return true
        }
        return false
    }
    
    func fetch<T: NSManagedObject>(managedObject: T.Type) -> AnyPublisher<[T], Error> {
        return Future<[T], Error> { promise in
            do {
                guard let result = try context.fetch(managedObject.fetchRequest()) as? [T] else {
                    promise(.success([]))
                    return
                }
                
                promise(.success(result))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}
