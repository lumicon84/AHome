//
//  ViewControllable.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/15.
//

import RIBs
import UIKit

extension ViewControllable {
  func setRoot(viewController: ViewControllable) {
    DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(300)) {
      let navCont = UINavigationController(rootViewController: viewController.uiviewController)
      UIApplication.shared.delegate?.window??.rootViewController = navCont
    }
  }
  
  func push(viewController: ViewControllable, animated: Bool = true) {
    uiviewController.navigationController?.pushViewController(
      viewController.uiviewController,
      animated: animated
    )
  }
  
  func pop(animated: Bool = true) {
    uiviewController.navigationController?.popViewController(animated: animated)
  }
  
  func pop(to viewController: ViewControllable, animated: Bool = true) {
    uiviewController.navigationController?.popToViewController(
      viewController.uiviewController,
      animated: animated
    )
  }
  
  func pop(_ viewController: ViewControllable, animated: Bool = true) {
    let hasViewControllerInNvaigationStack = uiviewController
      .navigationController?
      .viewControllers
      .contains {
        $0 === viewController.uiviewController
      } ?? false
    
    guard hasViewControllerInNvaigationStack else { return }
    pop(animated: animated)
  }
  
  func popToRootViewController(animated: Bool = true) {
    uiviewController.navigationController?.popToRootViewController(animated: animated)
  }
  
  func present(
    _ viewController: ViewControllable,
    animated: Bool = true,
    completion: (() -> Void)? = nil
  ) {
    DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(300)) { [weak self] in
      let viewController = viewController.uiviewController
      viewController.modalPresentationStyle = .fullScreen
      self?.uiviewController.present(
        viewController,
        animated: animated,
        completion: completion
      )
    }
  }
  
  func dismiss(
    _ viewController: ViewControllable,
    animated: Bool = true,
    completion: (() -> Void)? = nil
  ) {
    viewController.uiviewController.dismiss(
      animated: animated,
      completion: completion
    )
  }
  
  func dismissPresentedViewController(
    animated: Bool = true,
    completion: (() -> Void)? = nil
  ) {
    if let presentedViewController = uiviewController.presentedViewController {
      presentedViewController.dismiss(animated: animated, completion: completion)
    } else {
      completion?()
    }
  }
  
}
