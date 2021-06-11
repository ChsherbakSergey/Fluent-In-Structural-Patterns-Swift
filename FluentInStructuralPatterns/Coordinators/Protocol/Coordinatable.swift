//
//  Coordinatable.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import UIKit

protocol Coordinatable {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
