//
//  PhotosViewController.swift
//  ReactivePictures
//
//  Created by Amg on 02/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let photosViewModel: PhotosViewModelImplementation
    
    // MARK: - Inits
    
    init(photosViewModel: PhotosViewModelImplementation) {
        self.photosViewModel = photosViewModel
        super.init(nibName: "PhotosViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
