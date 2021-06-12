//
//  AlertFactory.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import UIKit

final class AlertFactory {
    
    static func showAlertWithButton(title: String? = nil, message: String? = nil, buttonTitle: String, buttonStyle: UIAlertAction.Style, completionAction: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        let customAction = UIAlertAction(title: buttonTitle, style: buttonStyle, handler: completionAction)
        
        alertController.addAction(cancelButton)
        alertController.addAction(customAction)
        
        return alertController
    }
}
