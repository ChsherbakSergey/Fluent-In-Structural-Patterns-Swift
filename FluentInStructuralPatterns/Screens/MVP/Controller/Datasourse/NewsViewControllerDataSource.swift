//
//  NewsViewControllerDataSource.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import UIKit

final class NewsViewControllerDataSource: NSObject, UITableViewDataSource {
    
    var posts: [Post] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
