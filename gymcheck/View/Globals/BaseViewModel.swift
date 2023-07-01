//
//  BaseViewModel.swift
//  gymcheck
//
//  Created by Gustavo Henriques on 17/06/23.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    
    deinit {
        subscriptions.forEach { $0.cancel() }
        print("\(self) destroyed.")
    }
}
