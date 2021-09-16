//
//  RootActionableProtocol.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/17.
//

import RxSwift

protocol RootActionableProtocol: AnyObject {
  func waitForSplash() -> Observable<(MainActionableProtocol)>
}
