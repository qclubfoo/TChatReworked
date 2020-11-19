//
//  ChannelsService.swift
//  t-chatReworked
//
//  Created by Дмитрий on 18.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Firebase

protocol IChannelsService {
    var delegate: IChannelServiceDelegate? { get set }
    
    func addNewChannel()
    func saveChannels()
    func loadChannels()
}

protocol IChannelServiceDelegate: class {
    func updateChannels(newChannels: [ChannelModel])
}

class ChannelService: IChannelsService {
   
    weak var delegate: IChannelServiceDelegate?
    
    private let coreAssembly: ICoreAssembly
    private var storage: ICoreDataStorage {
        coreAssembly.coreDataStorage
    }
    private var firebase: IFirebaseCore {
        coreAssembly.firebaseCore
    }
    
    init(coreAssembly: ICoreAssembly) {
        self.coreAssembly = coreAssembly
        // MARK: Where better execute setupChannelListner()
        self.setupChannelListner()
    }
    
    private func setupChannelListner() {
        firebase.reference.addSnapshotListener { [weak self] (snapshot, _) in
            if let documents = snapshot?.documents {
                var channels = [ChannelModel]()
                for document in documents {
                    let documentData = document.data()
                    guard let name = document.data()["name"] as? String else { continue }
                    let id = document.documentID
                    let lastMessage = documentData["lastMessage"] as? String
                    let lastActivityTimeStamp = documentData["lastActivity"] as? Timestamp
                    let lastActivity = lastActivityTimeStamp?.dateValue()
                    channels.append(ChannelModel(id: id,
                                                 name: name,
                                                 lastMessage: lastMessage,
                                                 lastActivityDate: lastActivity))
                }
                self?.saveInLocalStorage(fetchedData: channels)
            }
        }
    }
        
    private func saveInLocalStorage(fetchedData: [ChannelModel]) {
        storage.saveChannels(channels: fetchedData)
        loadChannels()
    }
    
    func addNewChannel() {
        print(#function)
    }
    
    func saveChannels() {
        print(#function)
    }
    
    func loadChannels() {
        storage.fetchChannels { [weak self] (channels, error) in
            if let channels = channels {
                if channels.count > 0 {
                    self?.delegate?.updateChannels(newChannels: channels)
                }
            } else {
                print(error ?? "Unexpected error")
            }
        }
    }
}
