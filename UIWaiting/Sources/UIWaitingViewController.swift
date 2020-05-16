//
//  UIWaitingViewExtend.swift
//  UIWatingViewController
//
//  Created by Cao Phuoc Thanh on 5/16/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public protocol UIWaitingViewExtend {
    
    func startWaiting(_ title: String?)
    func stopWaiting(_ calback: (() -> ())?)
}

private var waitingViewController: WaitingHubViewController?

extension UIWaitingViewExtend where Self: UIViewController {
    
    public func startWaiting(_ title: String? = nil)  {
        guard let topMostViewController: UIViewController = UIViewController.topMostViewController() else { return }
        let waitingIndicater: WaitingHubViewController = WaitingHubViewController()
        waitingViewController = waitingIndicater
        waitingIndicater.title = title
        waitingIndicater.modalPresentationStyle = .overFullScreen
        topMostViewController.present(waitingIndicater, animated: false, completion: nil)
    }
    
    public func stopWaiting(_ calback: (() -> ())? = nil)  {
        waitingViewController?.dismiss(animated: false)
        waitingViewController = nil
        calback?()
    }
}
