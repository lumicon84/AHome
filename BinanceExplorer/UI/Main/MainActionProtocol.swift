//
//  MainActionProtocol.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/17.
//

import RxSwift

protocol MainActionableProtocol: AnyObject {
  /// 해당 메뉴로 이동
  func routeInMainAction() -> Observable<(MainActionableProtocol, ())>
}
