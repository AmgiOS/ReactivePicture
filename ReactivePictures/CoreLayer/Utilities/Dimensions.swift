//
//  Dimensions.swift
//  ReactivePictures
//
//  Created by Amg on 03/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import UIKit

struct Dimensions {
    static let screenWidth: CGFloat
        = UIScreen.main.bounds.width
    static let screenHeight: CGFloat
        = UIScreen.main.bounds.height
    
    static let photosItemSize
        = CGSize(width: Dimensions.screenWidth * 0.45,
                 height: Dimensions.screenWidth * 0.45)
}
