//
//  PhotoDetailViewController.swift
//  ReactivePictures
//
//  Created by Amg on 03/06/2020.
//  Copyright © 2020 Amg-Gauthier. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PhotoDetailViewController: UIViewController {

    // MARK: - Private Properties
    
    private let viewModel: PhotoDetailViewModelImplementation
    private let disposeBag = DisposeBag()
    
    // MARK: - Init
    
    init(viewModel: PhotoDetailViewModelImplementation) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        // MARK: - Lifecycle Methods
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            bindImageView()
            bindDescriptionLabel()
            bindActivityIndicator()
            
            viewModel.viewDidLoad.accept(())
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            setupNavigationBar()
            setupNavigationItem()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            activityIndicator.center = self.photoImageView.center
        }
        
        lazy var photoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView
                .translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        lazy var descriptionLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var activityIndicator: UIActivityIndicatorView = {
            let indicator = UIActivityIndicatorView()
            indicator.hidesWhenStopped = true
            return indicator
        }()
    }

    // MARK: - Binding
    extension PhotoDetailViewController {
        func bindImageView() {
            viewModel.imageRetrievedSuccess
                .observeOn(MainScheduler.instance)
                .do(onNext: { [weak self] _ in
                    self?.photoImageView.alpha = 0
                    UIView.animate(withDuration: 0.25) {
                        self?.photoImageView.alpha = 1.0
                    }
                })
                .bind(to: photoImageView.rx.image)
                .disposed(by: disposeBag)
            
            viewModel.imageRetrievedError
                .observeOn(MainScheduler.instance)
                .do(onNext: { [weak self] _ in
                    self?.photoImageView.alpha = 0
                    UIView.animate(withDuration: 0.25) {
                        self?.photoImageView.alpha = 1.0
                        self?.photoImageView.backgroundColor = .black
                    }
                })
                .subscribe()
                .disposed(by: disposeBag)
        }
        
        func bindDescriptionLabel() {
            viewModel.description
                .observeOn(MainScheduler.instance)
                .bind(to: descriptionLabel.rx.text)
                .disposed(by: disposeBag)
        }
        
        func bindActivityIndicator() {
            viewModel.isLoading
                .observeOn(MainScheduler.instance)
                .bind(to: activityIndicator.rx.isAnimating)
                .disposed(by: disposeBag)
        }
    }

    // MARK: - UI Setup
    extension PhotoDetailViewController {
        private func setupUI() {
            if #available(iOS 13.0, *) {
                self.overrideUserInterfaceStyle = .light
            }
            self.view.backgroundColor = .white
            
            self.view.addSubview(photoImageView)
            self.view.addSubview(descriptionLabel)
            photoImageView.addSubview(activityIndicator)
            
            NSLayoutConstraint.activate([
                photoImageView.leftAnchor
                    .constraint(equalTo: self.view.leftAnchor),
                photoImageView.topAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                photoImageView.rightAnchor
                    .constraint(equalTo: self.view.rightAnchor),
                photoImageView.heightAnchor
                    .constraint(equalToConstant: Dimensions.screenHeight * 0.3)
            ])
            
            NSLayoutConstraint.activate([
                descriptionLabel.leftAnchor
                    .constraint(equalTo: self.view.leftAnchor,
                                constant: 20),
                descriptionLabel.topAnchor
                    .constraint(equalTo: self.photoImageView.bottomAnchor,
                                constant: 20),
                descriptionLabel.rightAnchor
                    .constraint(equalTo: self.view.rightAnchor,
                                constant: -20),
            ])
        }
        
        private func setupNavigationBar() {
               self.navigationController?.navigationBar.barTintColor = .white
               self.navigationController?.navigationBar.isTranslucent = false
           }
           
           private func setupNavigationItem() {
               self.navigationItem.title = "Photo Detail"
           }
    }

