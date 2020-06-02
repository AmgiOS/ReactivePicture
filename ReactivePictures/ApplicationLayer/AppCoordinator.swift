//
//  AppCoordinator.swift
//  ReactivePictures
//
//  Created by Amg on 02/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Private Properties
    
    private let window: UIWindow
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Public Methods
    
    func start() {
        let navigationController = UINavigationController()
        
        if #available(iOS 13.0, *) {
            navigationController.overrideUserInterfaceStyle = .light
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let photosCoordinator = PhotosCoordinatorImplementation(navigationController: navigationController)
        coordinate(to: photosCoordinator)
    }
}
