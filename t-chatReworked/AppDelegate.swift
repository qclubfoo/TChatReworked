//
//  AppDelegate.swift
//  t-chatReworked
//
//  Created by Дмитрий on 17.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var rootAssembly = RootAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = rootAssembly.presentationAssembly.channelsListVC().embedInNavigationControoler()
        
        window?.makeKeyAndVisible()
        
        return true
    }
}
