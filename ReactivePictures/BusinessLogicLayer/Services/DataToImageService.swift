//
//  DataToImageService.swift
//  ReactivePictures
//
//  Created by Amg on 02/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import UIKit

protocol DataToImageConversionService: class {
    func getImage(from data: Data) -> UIImage?
}

class DataToImageConversionServiceImplementation: DataToImageConversionService {
    
    func getImage(from data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}
