//
//  CoreAssembly.swift
//  t-chatReworked
//
//  Created by Дмитрий on 17.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

protocol ICoreAssembly {
    var coreDataStorage: ICoreDataStorage { get }
    var firebaseCore: IFirebaseCore { get }
}

class CoreAssembly: ICoreAssembly {
    lazy var coreDataStorage: ICoreDataStorage = CoreDataStorage()
    lazy var firebaseCore: IFirebaseCore = FirebaseCore()
}
