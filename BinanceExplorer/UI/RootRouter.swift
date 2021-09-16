//
//  RootRouter.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/15.
//

import RIBs

protocol RootInteractable: Interactable, SplashListener, MainListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
  private let splashBuilder: SplashBuildable
  private let mainBuilder: MainBuildable
  
  private var permissionsVr: ViewableRouting?
  private var splashVr: ViewableRouting?
  
  init(
    interactor: RootInteractable,
    viewController: RootViewControllable,
    splashBuilder: SplashBuildable,
    mainBuilder: MainBuildable
  ) {
    self.splashBuilder = splashBuilder
    self.mainBuilder = mainBuilder
    
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  func routeToSplash() {
    if let permissionsVr = permissionsVr {
      detachChild(permissionsVr)
      self.permissionsVr = nil
    }
    let splashVr = splashBuilder.build(withListener: interactor)
    self.splashVr = splashVr
    attachChild(splashVr)
    viewController.setRoot(viewController: splashVr.viewControllable)
  }
  
  func routeToMain() -> MainActionableProtocol {
    if let splashVr = splashVr {
      detachChild(splashVr)
      self.splashVr = nil
    }
    
    let mainVr = mainBuilder.build(withListener: interactor)
    attachChild(mainVr.router)
    viewController.setRoot(viewController: mainVr.router.viewControllable)
    return mainVr.actionableProtocol
  }
}
