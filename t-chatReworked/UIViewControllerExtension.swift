//
//  UIViewControllerExtension.swift
//  t-chatReworked
//
//  Created by Дмитрий on 18.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

extension UIViewController {
    func embedInNavigationControoler() -> UINavigationController {
        UINavigationController(rootViewController: self)
    }
}
