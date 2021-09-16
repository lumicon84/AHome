//
//  MainInteractor.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/15.
//

import RIBs
import RxSwift

protocol MainRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToMain()
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MainListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {

    weak var router: MainRouting?
    weak var listener: MainListener?
    
    private let apiService: ApiServiceType

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: MainPresentable,
         apiService: ApiServiceType) {
        self.apiService = apiService
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

extension MainInteractor: MainActionableProtocol {
    func routeInMainAction() -> Observable<(MainActionableProtocol, ())> {
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(300)) { [weak self] in
            self?.routeInMain()
        }
        
        return Observable.just((self, ()))
    }
    
    func routeInMain() {
        router?.routeToMain()
    }
    
}
