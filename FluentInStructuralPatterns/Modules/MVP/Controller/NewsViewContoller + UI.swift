//
//  NewsViewContoller + UI.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import UIKit

extension NewsViewController {
    
    //MARK: - Create Methods
    func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }
    
    //MARK: - Initial UI
    func setInitialUI() {
        view.backgroundColor = .systemBackground
        setNavigationBar()
        addViews(into: view)
        layoutViews(in: view)
    }
    
    func setNavigationBar() {
        navigationItem.title = "News"
    }
    
    func addViews(into view: UIView) {
        view.addSubview(tableView)
    }
    
    func layoutViews(in view: UIView) {
        tableView.anchor(top: view.topAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor)
    }
}
