//
//  UnsplashPhoto.swift
//  ReactivePictures
//
//  Created by Amg on 03/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import Foundation

struct UnsplashPhoto: Codable {
    let id: String?
    let description: String?
    let altDescription: String?
    let urls: Urls?
    
    enum CodingKeys: String, CodingKey {
        case id, description
        case altDescription = "alt_description"
        case urls
    }
}

struct Urls: Codable {
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
    }
}
