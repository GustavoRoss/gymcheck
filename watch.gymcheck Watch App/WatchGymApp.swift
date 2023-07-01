//
//  watch_gymcheckApp.swift
//  watch.gymcheck Watch App
//
//  Created by Gustavo Henriques on 24/06/23.
//

import SwiftUI
import Swinject

@main
struct WatchGymApp: App {
    let container = Container()
    
    var assembler: Assembler {
        return Assembler([
            RepositoryAssembly(),
            ViewModelAssembly()
        ], container: container)
    }
    
    var body: some Scene {
        let coordinator = AppCordinator(assembler: assembler)
        
        WindowGroup {
            NavigationView {
                
                coordinator.makeTrainingList()
            }.environmentObject(coordinator)
        }
    }
}
