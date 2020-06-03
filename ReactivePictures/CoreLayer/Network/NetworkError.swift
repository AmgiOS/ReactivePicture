//
//  NetworkError.swift
//  ReactivePictures
//
//  Created by Amg on 03/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingFailed
    case unknown
}
