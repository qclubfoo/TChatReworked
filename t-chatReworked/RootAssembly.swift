//
//  RootAssembly.swift
//  t-chatReworked
//
//  Created by Дмитрий on 17.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

class RootAssembly {
    lazy var presentationAssembly: IPresentationAssembly = PresentationAssembly(serviceAssembly: self.serviceAssembly)
    private lazy var serviceAssembly: IServiceAssembly = ServiceAssembly(coreAssembly: self.coreAssembly)
    private lazy var coreAssembly: ICoreAssembly = CoreAssembly()
}
