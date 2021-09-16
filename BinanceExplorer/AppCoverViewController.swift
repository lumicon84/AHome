//
//  AppCoverViewController.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/17.
//

import UIKit

final class AppCoverViewController: BaseViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    label.text = "Custom Splash"
    
    view.addSubview(label)
    view.backgroundColor = UIColor.white
    label.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
}
