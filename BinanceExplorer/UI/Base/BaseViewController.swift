//
//  BaseViewController.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/14.
//
import UIKit
import RxSwift
import RxCocoa
import SnapKit

/*
 공통 UIViewController
 */
class BaseViewController: UIViewController {
  var isNavBarHidden: Bool = true // navigation bar 숨기고 싶을때 true로 설정
  var disposeBag = DisposeBag()
  var bottomPadding: CGFloat = 0
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  deinit {
    print("DEINIT")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = isNavBarHidden
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  /// 확인/취소 팝업 띄우기
  /// completion / rx return 둘 다 각각 사용 가능
//  @discardableResult
//  func openTwoButtonAlert(
//    title: String? = nil,
//    msg: String,
//    cancel: String? = nil,
//    confirm: String? = nil,
//    completion: AlertResultReturnType? = nil
//  ) -> Observable<AlertResult> {
//    let alertCont = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//    let contentViewCont = CommonAlertViewController(title: title, msg: msg, cancel: cancel, confirm: confirm, completion: completion)
//    contentViewCont.preferredContentSize.height = 188
//    alertCont.setValue(contentViewCont, forKey: "contentViewController")
//    present(alertCont, animated: true, completion: nil)
//    return contentViewCont.rx.alertResult
//  }
//
//  /// 확인 팝업 띄우기
//  @discardableResult
//  func openConfirmAlert(title: String? = nil, msg: String) -> Observable<AlertResult> {
//    let alertCont = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//    let contentViewCont = CommonAlertViewController(title: title, msg: msg, needCancel: false)
//    contentViewCont.preferredContentSize.height = 188
//    alertCont.setValue(contentViewCont, forKey: "contentViewController")
//    present(alertCont, animated: true)
//    return contentViewCont.rx.alertResult
//  }
//
//  /// 확인 팝업 띄우기
//  func openConfirmAlert(title: String? = nil, msg: String, completion: AlertResultReturnType?) {
//    let alertCont = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//    let contentViewCont = CommonAlertViewController(title: title, msg: msg, needCancel: false, completion: completion)
//    contentViewCont.preferredContentSize.height = 188
//    alertCont.setValue(contentViewCont, forKey: "contentViewController")
//
//    if let topViewCont = UIApplication.topViewCont() {
//      if topViewCont.isKind(of: UIAlertController.self) {
//        topViewCont.dismiss(animated: true) { [weak self] in
//          self?.present(alertCont, animated: true)
//        }
//      } else if topViewCont.isKind(of: SecureKeyboardViewController.self) {
//        if let topVCPresentingCont = topViewCont.presentingViewController {
//          topVCPresentingCont.present(alertCont, animated: true)
//        }
//      } else {
//        topViewCont.present(alertCont, animated: true)
//      }
//    }
//  }
//
//  /// 확인 팝업 띄우기 (확인버튼 문구 수정 가능)
//  func openConfirmAlert(title: String? = nil, confirm: String? = nil, msg: String) -> Observable<AlertResult> {
//    let alertCont = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//    let contentViewCont = CommonAlertViewController(title: title, msg: msg, needCancel: false, confirm: confirm)
//    contentViewCont.preferredContentSize.height = 188
//    alertCont.setValue(contentViewCont, forKey: "contentViewController")
//    present(alertCont, animated: true)
//    return contentViewCont.rx.alertResult
//  }
//
//  /// 확인 팝업 띄우기 (확인버튼 문구 수정 가능)
//  func openConfirmAlert(title: String? = nil, msg: String, confirm: String? = nil, completion: AlertResultReturnType?) {
//    let alertCont = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//    let contentViewCont = CommonAlertViewController(title: title, msg: msg, needCancel: false, confirm: confirm, completion: completion)
//    contentViewCont.preferredContentSize.height = 188
//    alertCont.setValue(contentViewCont, forKey: "contentViewController")
//
//    if let topViewCont = UIApplication.topViewCont() {
//      if topViewCont.isKind(of: UIAlertController.self) {
//        topViewCont.dismiss(animated: true) { [weak self] in
//          self?.present(alertCont, animated: true)
//        }
//      } else if topViewCont.isKind(of: SecureKeyboardViewController.self) {
//        if let topVCPresentingCont = topViewCont.presentingViewController {
//          topVCPresentingCont.present(alertCont, animated: true)
//        }
//      } else {
//        topViewCont.present(alertCont, animated: true)
//      }
//    }
//  }
//
//  /// 에러 팝업 띄우기
//  func openErrorAlert(_ error: HNError, completion: AlertResultReturnType? = nil) {
//    var completion = completion
//
//    if let resCode = error.resCode {
//      // 중복로그인시 로그아웃 처리
//      if resCode == "SBS9999" || resCode == "SBS9998" {
//        completion = { _ -> Void in
//          NotificationCenter.default.post(
//            name: NSNotification.Name(rawValue: Noti.requestLogout),
//            object: nil,
//            userInfo: [:]
//          )
//        }
//      }
//    }
//
//    let msg = error.message
//    let alertCont = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//    let contentViewCont = CommonAlertViewController(title: nil, msg: msg, needCancel: false, completion: completion)
//    contentViewCont.preferredContentSize.height = 188
//    alertCont.setValue(contentViewCont, forKey: "contentViewController")
//    present(alertCont, animated: true)
//  }
//
//  /// 에러 화면 띄우기
//  @discardableResult
//  func openErrorPageAlert(_ error: HNError) -> Observable<AlertResult> {
//    let viewCont = ErrorViewController(error: error)
//    viewCont.modalPresentationStyle = .fullScreen
//    present(viewCont, animated: true)
//    return viewCont.rx.alertResult
//  }
}

class BaseNibViewController: BaseViewController {
  override init() {
    let xib = String(describing: type(of: self))
    super.init(nibName: xib, bundle: Bundle.main)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

//extension Reactive where Base: BaseViewController {
//  var isLoading: Binder<Bool> {
//    Binder<Bool>(base) { view, isLoading in
//      view.isLoading = isLoading
//    }
//  }
//}
//extension BaseViewController {
//  func callDelay(completion: @escaping () -> Void) {
//    if !locking.isLocking {
//      completion()
//      locking.callDelay()
//    }
//  }
//}
