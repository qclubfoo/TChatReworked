//
//  CoreDataStack.swift
//  t-chatReworked
//
//  Created by Дмитрий on 18.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import CoreData

class CoreDataStack {
    private var container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    init() {
        let initialContainer = NSPersistentContainer(name: "Chat")
        initialContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Can't load persistent store. Unexpected error \(error)")
            }
        }
        self.container = initialContainer
        self.container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
    }
}
