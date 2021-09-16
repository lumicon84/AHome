//
//  RootBuilder.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/15.
//

import RIBs
import SwinjectAutoregistration

protocol RootDependency: Dependency {
}

final class RootComponent: Component<RootDependency>, SplashDependency, MainDependency {
  
  override init(dependency: RootDependency) {
    super.init(dependency: dependency)
  }
}

protocol RootBuildable: Buildable {
  func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
  override init(dependency: RootDependency) {
    super.init(dependency: dependency)
  }

  func build() -> LaunchRouting {
    let component = RootComponent(dependency: dependency)
    let viewController = RootViewController()
    let interactor = RootInteractor(presenter: viewController)
    
    let splashBuilder = SplashBuilder(dependency: component)
    let mainBuilder = MainBuilder(dependency: component)
    
    let router = RootRouter(
      interactor: interactor,
      viewController: viewController,
      splashBuilder: splashBuilder,
      mainBuilder: mainBuilder
    )
    return router
  }
}
