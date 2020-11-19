//
//  CoreDataStorage.swift
//  t-chatReworked
//
//  Created by Дмитрий on 17.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import CoreData

protocol ICoreDataStorage {
    func saveChannels(channels: [ChannelModel])
    func fetchChannels(completion: @escaping ([ChannelModel]?, String?) -> Void)
}

class CoreDataStorage: ICoreDataStorage {
    
    private let coreDataStack = CoreDataStack()
    private var viewContext: NSManagedObjectContext {
        coreDataStack.viewContext
    }
    
    func saveChannels(channels: [ChannelModel]) {
        addChannelsToViewContext(channels)
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Can't save data into view context\n\(error.localizedDescription)")
            }
        }
    }
    
    func fetchChannels(completion: @escaping ([ChannelModel]?, String?) -> Void) {
        let fetchRequest = ChannelDM.createFetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "lastActivity", ascending: false),
            NSSortDescriptor(key: "name", ascending: true)
        ]
            if let fetchResult = try? viewContext.fetch(fetchRequest) {
            let channels = convertDataModelIntoModel(coreDataModels: fetchResult)
            completion(channels, nil)
        } else {
            completion(nil, "Can't fetch data from data base")
        }
    }
    
    private func addChannelsToViewContext(_ channels: [ChannelModel]) {
        for channel in channels {
            _ = ChannelDM(context: viewContext,
                      id: channel.id,
                      name: channel.name,
                      lastActivity: channel.lastActivityDate,
                      lastMessage: channel.lastActivityString)
        }
    }
    
    private func convertDataModelIntoModel(coreDataModels: [ChannelDM]) -> [ChannelModel] {
        var chanels = [ChannelModel]()
        for model in coreDataModels {
            let channel = ChannelModel(id: model.id,
                                       name: model.name,
                                       lastMessage: model.lastMessage,
                                       lastActivityDate: model.lastActivity)
            chanels.append(channel)
        }
        return chanels
    }
}
