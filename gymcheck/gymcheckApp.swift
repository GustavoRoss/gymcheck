//
//  gymcheckApp.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 09/06/23.
//

import SwiftUI
import Swinject

@main
struct gymcheckApp: App {

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
            NavigationStack {
                
                coordinator.makeTrainigListView()
            }.environmentObject(coordinator)
        }
    }
}
