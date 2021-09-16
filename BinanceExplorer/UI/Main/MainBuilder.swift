//
//  MainBuilder.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/15.
//

import RIBs
import SwinjectAutoregistration

protocol MainDependency: Dependency {
}

final class MainComponent: Component<MainDependency> {
    
    fileprivate let apiService: ApiServiceType
    
    override init(dependency: MainDependency) {
//        apiService = container ~> ApiServiceType.self
        self.apiService = container ~> ApiServiceType.self
        
        super.init(dependency: dependency)
    }
    
}

// MARK: - Builder

protocol MainBuildable: Buildable {
    func build(withListener listener: MainListener) -> (router: MainRouting, actionableProtocol: MainActionableProtocol)
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {
    
    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MainListener) -> (router: MainRouting, actionableProtocol: MainActionableProtocol) {
        let component = MainComponent(dependency: dependency)
        let viewController = MainViewController()
        let interactor = MainInteractor(presenter: viewController,
                                        apiService: component.apiService)
        interactor.listener = listener
        
        // 메인화면에서 뻗어갈 트리형태의 화면들은
        // Builder로 만들어서 아래의 MainRouter에 추가해주는 방식으로 진행
        let router = MainRouter(interactor: interactor,
                                viewController: viewController,
                                apiService: component.apiService)
        
        return (router, interactor)
    }
}
