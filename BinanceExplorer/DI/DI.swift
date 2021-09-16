//
//  DI.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/16.
//

import Swinject
import SwinjectAutoregistration


/*
 swinject DI 등록
 */
let container = Container {
    $0.autoregister(ApiServiceType.self, initializer: ApiService.init).inObjectScope(.container)
}
