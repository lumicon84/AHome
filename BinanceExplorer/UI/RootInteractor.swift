//
//  RootInteractor.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/15.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func routeToSplash()
    func routeToMain() -> MainActionableProtocol
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?
    
    private let mainActionableProtocolSubject: ReplaySubject<MainActionableProtocol>

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        mainActionableProtocolSubject = ReplaySubject<MainActionableProtocol>.create(bufferSize: 1)
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        showSplash()
    }

    func showSplash() {
        router?.routeToSplash()
    }
    
    func finishSplash() {
        router?.routeToMain()
    }
    
    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}


extension RootInteractor: RootActionableProtocol {
  // splash 화면 끝날 때 까지 대기
  func waitForSplash() -> Observable<MainActionableProtocol> {
    return mainActionableProtocolSubject.asObservable()
  }
}
