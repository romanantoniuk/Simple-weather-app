//
//  UINavigationController+extension.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import UIKit

extension UINavigationController {
    
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}
