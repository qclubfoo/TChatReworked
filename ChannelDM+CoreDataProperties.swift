//
//  ChannelDM+CoreDataProperties.swift
//  t-chatReworked
//
//  Created by Дмитрий on 18.11.2020.
//  Copyright © 2020 home. All rights reserved.
//
//

import Foundation
import CoreData

extension ChannelDM {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<ChannelDM> {
        return NSFetchRequest<ChannelDM>(entityName: "ChannelDM")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var lastActivity: Date?
    @NSManaged public var lastMessage: String?
    
    convenience init(context: NSManagedObjectContext, id: String, name: String, lastActivity: Date?, lastMessage: String?) {
        self.init(context: context)
        self.id = id
        self.name = name
        self.lastActivity = lastActivity
        self.lastMessage = lastMessage
    }

}
