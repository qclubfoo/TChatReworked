//
//  FirebaseCore.swift
//  t-chatReworked
//
//  Created by Дмитрий on 19.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Firebase

protocol IFirebaseCore {
    var reference: CollectionReference { get }
}

class FirebaseCore: IFirebaseCore {
    
    private let dataBase: Firestore
    let reference: CollectionReference
    
    init() {
        FirebaseApp.configure()
        dataBase = Firestore.firestore()
        reference = self.dataBase.collection(Constants.Firebase.collectionPath)
    }
}
