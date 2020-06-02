//
//  Coordinator.swift
//  ReactivePictures
//
//  Created by Amg on 02/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    func start()
    func coordinate(to coordinator: Coordinator)
}

// MARK: - Base Coordinator
extension Coordinator {
    
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
