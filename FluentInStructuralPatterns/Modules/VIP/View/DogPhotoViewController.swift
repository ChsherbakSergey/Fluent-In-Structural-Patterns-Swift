//
//  DogPhotoViewController.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

final class DogPhotoViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var dogPhotoImageView: UIImageView = makeImageView()
    private lazy var activityIndicatorView: UIActivityIndicatorView = makeActivityIndicatorView()
    
    //MARK: - Properties
    weak var coordinator: VIPCoordinator?
    private let interactor: DogPhotoInteractorInterface
    
    //MARK: - Init(-s)
    init(interactor: DogPhotoInteractorInterface) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        interactor.fetchPhoto()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
    }
    
    //MARK: - Internal Methods
    internal func setDogPhotoImageView(with image: UIImage) {
        dogPhotoImageView.image = image
        activityIndicatorView.stopAnimating()
    }
    
    internal func showErrorAlert(with error: Error) {
        let alert = AlertFactory.showAlertWithButton(title: error.localizedDescription, buttonTitle: "OK", buttonStyle: .default, completionAction: nil)
        present(alert, animated: true)
    }
}

//MARK: - UI
private extension DogPhotoViewController {
    
    func setInitialUI() {
        view.backgroundColor = .systemBackground
        setNavigationBar()
        view.addSubview(dogPhotoImageView)
        view.addSubview(activityIndicatorView)
        dogPhotoImageView.center(inView: view)
        activityIndicatorView.center(inView: view)
    }
}
