//
//  AppComponent.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/13.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
  init() {
    super.init(dependency: EmptyComponent())
  }
}
