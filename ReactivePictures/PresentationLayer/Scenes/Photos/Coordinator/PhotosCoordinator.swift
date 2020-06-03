//
//  PhotosCoordinator.swift
//  ReactivePictures
//
//  Created by Amg on 02/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import Foundation
import UIKit

protocol PhotosCoordinator: class {
    func pushToDetailPhoto(with photoId: String)
}

class PhotosCoordinatorImplementation: Coordinator {
    
    // MARK: - Properties
    
    private unowned let navigationController: UINavigationController
    
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = PhotosViewModelImplementation(photosService: UnsplashPhotosServiceImplementation(),
                                                      photoLoadingService: DataLoadingServiceImplementation(),
                                                      dataToImageService: DataToImageConversionServiceImplementation(),
                                                      coordinator: self)
        
        let photosViewController = PhotosViewController(photosViewModel: viewModel)
        navigationController.pushViewController(photosViewController, animated: true)
    }
    
}

// MARK: - PhotosCoordinator
extension PhotosCoordinatorImplementation: PhotosCoordinator {
    func pushToDetailPhoto(with photoId: String) {
        let photoDetailCoordinator = PhotoDetailCoordinatorImplementation(navigationController: navigationController,
                                                                 photoId: photoId)
        coordinate(to: photoDetailCoordinator)
    }
}
