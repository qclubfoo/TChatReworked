//
//  ChannelsListVCModel.swift
//  t-chatReworked
//
//  Created by Дмитрий on 18.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

protocol IChannelsListVCModel {
    var delegate: IChannelsListVCModelDelegate? { get }
    
    func fetchChannels()
    func saveChannels()
}

protocol IChannelsListVCModelDelegate: class {
    func setup(dataSource: [ChannelModel])
}

class ChannelsListVCModel: IChannelsListVCModel {
    
    weak var delegate: IChannelsListVCModelDelegate?
    
    private var channelsService: IChannelsService
    
    init(channelsService: IChannelsService) {
        self.channelsService = channelsService
        self.channelsService.delegate = self
    }
    
    func fetchChannels() {
        channelsService.loadChannels()
    }
    
    func saveChannels() {
        print(#function)
    }
}

extension ChannelsListVCModel: IChannelServiceDelegate {
    func updateChannels(newChannels: [ChannelModel]) {
        delegate?.setup(dataSource: newChannels)
    }
    
}
