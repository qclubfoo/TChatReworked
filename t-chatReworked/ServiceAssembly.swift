//
//  ServiceAssembly.swift
//  t-chatReworked
//
//  Created by Дмитрий on 18.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

protocol IServiceAssembly {
    var channelService: IChannelsService { get }
}

class ServiceAssembly: IServiceAssembly {
    
    private let coreAssembly: ICoreAssembly
    
    init(coreAssembly: ICoreAssembly) {
        self.coreAssembly = coreAssembly
    }
    
    lazy var channelService: IChannelsService = ChannelService(coreAssembly: self.coreAssembly)
    
}
