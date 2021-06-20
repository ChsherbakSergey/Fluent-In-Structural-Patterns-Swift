//
//  NewsViewController.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import UIKit

final class NewsViewController: UIViewController {
    
    //MARK: - UI Elements
    lazy var tableView = createTableView()
    
    var coordinator: MVPCoordinator?
    private let presenter: NewsPresenterInterface = NewsPresenter()
    private let dataSourse: NewsViewControllerDataSource = NewsViewControllerDataSource()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
        tableView.dataSource = dataSourse
        presenter.setupDelegate(delegate: self)
        presenter.fetchPosts(with: URLConstants.postsURL)
    }
}

//MARK: - NewsViewControllerViewDelegate
extension NewsViewController: NewsViewControllerViewDelegate {
    
    func displayPosts(_ posts: [Post]) {
        dataSourse.posts = posts
        tableView.reloadData()
    }
    
    func displayError(_ error: NetworkingError) {
        let alert = AlertFactory.showAlertWithButton(message: error.rawValue, buttonTitle: "Ok", buttonStyle: .default, completionAction: nil)
        present(alert, animated: true)
    }
}
