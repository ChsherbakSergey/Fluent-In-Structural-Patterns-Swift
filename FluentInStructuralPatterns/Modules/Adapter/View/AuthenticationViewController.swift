//
//  AuthenticationViewController.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import UIKit

final class AuthenticationViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var emailTextField = makeTextField(placeholder: "Email...", isSecureTextEntry: false)
    private lazy var passwordTextField = makeTextField(placeholder: "Password...", isSecureTextEntry: true)
    private lazy var textFieldsStackView = makeVerticalStackView(arrangedSubview: [emailTextField, passwordTextField])
    
    private lazy var TWLoginButton = makeLoginButton(with: "Login with Twitter", backgrounColor: .twitterSolid)
    private lazy var AppLoginButton = makeLoginButton(with: "Login", backgrounColor: .bumbleSolid)
    private lazy var loginButtonsStackView = makeVerticalStackView(arrangedSubview: [TWLoginButton, AppLoginButton])

    //MARK: - Properties
    weak var coordinator: AdapterCoordinator?
    private let presenter: AuthenticationPresenterInterface = AuthenticationPresenter()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
        addTargets()
        presenter.setupDelegate(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

//MARK: - AuthenticationViewControllerViewDelegate
extension AuthenticationViewController: AuthenticationViewControllerViewDelegate {
    
    func successLogin(_ user: User) {
        let alert = AlertFactory.showAlertWithButton(title: "Successfully logged in", message: "User is: \(user.email)", buttonTitle: "OK", buttonStyle: .default, completionAction: nil)
        present(alert, animated: true)
        print("User is: \(user)")
    }
}

//MARK: - UITextFieldDelegate
extension AuthenticationViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}

//MARK: - User Interactions
private extension AuthenticationViewController {
    
    func addTargets() {
        TWLoginButton.addTarget(self, action: #selector(handleTWLoginButtonTapped(_:)), for: .touchUpInside)
        AppLoginButton.addTarget(self, action: #selector(handleAppLoginButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func handleTWLoginButtonTapped(_ sender: UIButton) {
        guard let inputData: (email: String, password: String) = checkInputData(email: emailTextField.text, password: passwordTextField.text) else { return }
        presenter.login(email: inputData.email, password: inputData.password, authenticationService: presenter.TWAuthenticationService)
    }
    
    @objc func handleAppLoginButtonTapped(_ sender: UIButton) {
        guard let inputData: (email: String, password: String) = checkInputData(email: emailTextField.text, password: passwordTextField.text) else { return }
        presenter.login(email: inputData.email, password: inputData.password, authenticationService: presenter.AppAuthenticationService)
    }
    
    func checkInputData(email: String?, password: String?) -> (String, String)? {
        guard let email = email, !email.isEmpty,
              let password = password, !password.isEmpty else {
            showSnackAlert(with: "✏️", text: "All fields must be set", textColor: .systemBackground, backgroundColor: .label)
            return nil }
        return (email, password)
    }
}

//MARK: - UI
private extension AuthenticationViewController {
    
    func setupInitialUI() {
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        addViews(into: view)
        layoutViews(in: view)
        setDelegates()
    }
    
    func addViews(into view: UIView) {
        view.addSubview(textFieldsStackView)
        view.addSubview(loginButtonsStackView)
    }
    
    func layoutViews(in view: UIView) {
        textFieldsStackView.centerY(inView: view)
        textFieldsStackView.anchor(left: view.leftAnchor,
                                   right: view.rightAnchor,
                                   paddingLeft: 40.0,
                                   paddingRight: 40.0)
        loginButtonsStackView.anchor(left: view.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.rightAnchor,
                         paddingLeft: 40.0,
                         paddingBottom: 32.0,
                         paddingRight: 40.0)
    }
    
    func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

