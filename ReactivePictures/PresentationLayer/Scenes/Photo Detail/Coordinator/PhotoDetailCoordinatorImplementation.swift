//
//  PhotoDetailCoordinatorImplementation.swift
//  ReactivePictures
//
//  Created by Amg on 03/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import UIKit

protocol PhotoDetailCoordinator: class {}

class PhotoDetailCoordinatorImplementation: Coordinator {
    unowned let navigationController: UINavigationController
    let photoId: String
    
    init(navigationController: UINavigationController, photoId: String) {
        self.navigationController = navigationController
        self.photoId = photoId
    }
    
    func start() {
        let photoDetailViewModel = PhotoDetailViewModelImplementation(
            photosService: UnsplashPhotosServiceImplementation(),
            photoLoadingService: DataLoadingServiceImplementation(),
            dataToImageService: DataToImageConversionServiceImplementation(),
            coordinator: self,
            photoId: photoId
        )
        
        let photoDetailViewController = PhotoDetailViewController(viewModel: photoDetailViewModel)
        navigationController.pushViewController(photoDetailViewController,
                                                animated: true)
    }
}

extension PhotoDetailCoordinatorImplementation: PhotoDetailCoordinator {}

