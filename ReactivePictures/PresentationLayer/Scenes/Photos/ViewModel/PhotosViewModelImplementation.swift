//
//  PhotosViewModelImplementation.swift
//  ReactivePictures
//
//  Created by Amg on 02/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PhotosViewModel: class {
    // Input
    var viewDidLoad: PublishRelay<Void> { get }
    var willDisplayCellAtIndex: PublishRelay<Int> { get }
    var didEndDisplayingCellAtIndex: PublishRelay<Int> { get }
    var didChoosePhotoWithId: PublishRelay<String> { get }
    var didScrollToTheBottom: PublishRelay<Void> { get }
    
    // Output
    var isLoadingFirstPage: BehaviorRelay<Bool> { get }
    var isLoadingAdditionalPhotos: BehaviorRelay<Bool> { get }
    var unsplashPhotos: BehaviorRelay<[UnsplashPhoto]> { get }
    var imageRetrievedSuccess: PublishRelay<(UIImage, Int)> { get }
    var imageRetrievedError: PublishRelay<Int> { get }
}


class PhotosViewModelImplementation {
    
    // MARK: - Private Properties
    
    
}
