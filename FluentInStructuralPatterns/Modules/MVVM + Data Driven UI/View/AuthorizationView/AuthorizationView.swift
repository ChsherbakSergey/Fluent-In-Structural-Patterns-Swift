//
//  AuthorizationView.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import UIKit

final class AuthorizationView: UIView {
    
    var authorizationState: AuthorizationState = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    //MARK: - UI Elements
    private lazy var activityIndicatorView = makeActivityIndicatorView()
    private lazy var resultLabel = makeResultLabel()
    lazy var signInButton = makeSignInButton()
    lazy var signInWithErrorButton = makeSignInWithErrorButton()
    
    //MARK: - Init(-s)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setInitialUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        updateUI(for: authorizationState)
    }
    
    //MARK: - Private Methods
    private func updateUI(for state: AuthorizationState) {
        switch state {
        
        case .initial:
            activityIndicatorView.isHidden = true
            resultLabel.isHidden = true
            
        case .loading:
            activityIndicatorView.isHidden = false
            activityIndicatorView.startAnimating()
            resultLabel.isHidden = true
            
        case .success(let response):
            activityIndicatorView.isHidden = true
            activityIndicatorView.stopAnimating()
            resultLabel.isHidden = false
            resultLabel.text = response.title
            
        case .failure(let response):
            activityIndicatorView.isHidden = true
            activityIndicatorView.stopAnimating()
            resultLabel.isHidden = false
            resultLabel.text = response.title
        }
    }
    
    private func setInitialUI() {
        addViews(into: self)
        layoutViews(in: self)
    }
    
    private func addViews(into view: UIView) {
        view.addSubview(signInButton)
        view.addSubview(signInWithErrorButton)
        view.addSubview(activityIndicatorView)
        view.addSubview(resultLabel)
    }
    
    private func layoutViews(in view: UIView) {
        signInButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
                            paddingLeft: 32.0, paddingBottom: 128.0, paddingRight: 32.0)
        signInWithErrorButton.anchor(top: signInButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                            paddingTop: 12.0, paddingLeft: 32.0, paddingRight: 32.0)
        activityIndicatorView.center(inView: self)
        resultLabel.centerY(inView: self)
        resultLabel.anchor(left: view.leftAnchor, right: view.rightAnchor,
                           paddingLeft: 52.0, paddingRight: 52.0)
    }
    
}
