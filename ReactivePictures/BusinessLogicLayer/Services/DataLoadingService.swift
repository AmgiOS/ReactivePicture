//
//  DataLoadingService.swift
//  ReactivePictures
//
//  Created by Amg on 02/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

protocol DataLoadingService: class {
    func loadData(for urlString: String) -> Observable<(Data?, Error?)>
    func loadData(at index: Int,
                  for urlString: String) -> Observable<(Data?, Error?)>
    func stopLoading(at index: Int)
}

class DataLoadingServiceImplementation: DataLoadingService {
    
    // MARK: - Private Properties
    
    private var tasks: [Int: Disposable] = [:]
    
    
    // MARK: - Public Methods
    
    func loadData(at index: Int, for urlString: String) -> Observable<(Data?, Error?)> {
        return Observable.create { [weak self] observer in
            guard let url = URL(string: urlString) else {
                observer.onNext((nil, NetworkError.invalidURL))
                return Disposables.create()
            }
            
            let task = NetworkClient.getData(url)
                .subscribe(onNext: { (data, error) in
                    guard let data = data, error == nil else {
                        observer.onNext((nil, error))
                        return
                    }
                    
                    observer.onNext((data, nil))
                })
            self?.tasks[index] = task
            
            return Disposables.create {
                task.dispose()
            }
        }
    }
    
    func loadData(for urlString: String) -> Observable<(Data?, Error?)> {
         return Observable.create { observer in
            
            guard let url = URL(string: urlString) else {
                observer.onNext((nil, NetworkError.invalidURL))
                return Disposables.create()
            }
            
            let task = NetworkClient.getData(url)
                .subscribe(onNext: { (data, error) in
                    guard let data = data, error == nil else {
                        observer.onNext((nil, error))
                        return
                    }
                    
                    observer.onNext((data, nil))
                })
            
            return Disposables.create {
                task.dispose()
            }
        }
    }
    
    func stopLoading(at index: Int) {
        print("Cancel task at index: \(index)")
        tasks[index]?.dispose()
    }
}
