//
//  MainRouter.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/15.
//

import RIBs
import RxSwift

protocol MainInteractable: Interactable {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class MainRouter: ViewableRouter<MainInteractable, MainViewControllable>, MainRouting {
    var disposeBag = DisposeBag()
    
    private let apiService: ApiServiceType
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: MainInteractable,
         viewController: MainViewControllable,
         apiService: ApiServiceType) {
        self.apiService = apiService
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToMain() {
        viewController.dismissPresentedViewController(animated: false)
        viewController.popToRootViewController(animated: false)
        
        if let children = children as? [ViewableRouting] {
            children.forEach {
                detachChild($0)
            }
        }
    }
}
