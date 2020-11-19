//
//  PresentationAssembly.swift
//  t-chatReworked
//
//  Created by Дмитрий on 18.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

protocol IPresentationAssembly {
    func channelsListVC() -> ChannelsListVC
    func profileVC() -> ProfileVC
    func downloadAvatarVC() -> DownloadAvatarVC
}

class PresentationAssembly: IPresentationAssembly {
    private let serviceAssembly: IServiceAssembly
    
    init(serviceAssembly: IServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    func channelsListVC() -> ChannelsListVC {
        let model = ChannelsListVCModel(channelsService: self.serviceAssembly.channelService)
        let vc = ChannelsListVC.storyboardInstance(model: model, presentationAssembly: self)
        model.delegate = vc
        return vc
    }
    
    func profileVC() -> ProfileVC {
        ProfileVC.storyboardInstance(presentationAssembly: self)
    }
    
    func downloadAvatarVC() -> DownloadAvatarVC {
        DownloadAvatarVC.storyboardInstance(presentationAssembly: self)
    }
    
}
