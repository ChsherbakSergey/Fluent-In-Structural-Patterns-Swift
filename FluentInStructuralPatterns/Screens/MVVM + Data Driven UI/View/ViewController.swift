//
//  AuthorizationViewController.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import UIKit

final class AuthorizationViewController: UIViewController {

    weak var coordinator: MVVMCoordinator?
    private var viewModel: AuthorizationViewModelProtocol = AuthorizationViewModel()
    private lazy var authorizationView: AuthorizationView = AuthorizationView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
    }
}

//MARK: - UI
private extension AuthorizationViewController {
    
    func setInitialUI() {
        view.backgroundColor = .twitterSolid
        setNavigationBar()
        addViews(into: view)
        layoutViews(in: view)
    }
    
    func setNavigationBar() {
        navigationItem.title = "Authorization"
    }
    
    func addViews(into view: UIView) {
        view.addSubview(authorizationView)
    }
    
    func layoutViews(in view: UIView) {
        authorizationView.anchor(top: view.topAnchor,
                                 left: view.leftAnchor,
                                 bottom: view.bottomAnchor,
                                 right: view.rightAnchor)
    }
    
    func addTargets() {
        authorizationView.signInButton.addTarget(self, action: #selector(handleSignInButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func handleSignInButtonTapped(_ sender: UIButton) {
        viewModel.signIn()
    }
    
    func updateUI() {
        viewModel.updateViewData = { [weak self] state in
            self?.authorizationView.authorizationState = state
        }
    }
}
