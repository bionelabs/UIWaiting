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
    func setWaitingBackgroundColor() -> UIColor
    func setWaitingIndicatorBackgroundColor() -> UIColor
    func setWaitingTitleColor() -> UIColor
    func setWaitingTitleFont() -> UIFont
}

private var waitingViewController: WaitingHubViewController?

extension UIWaitingViewExtend where Self: UIViewController {
    
    public func setWaitingBackgroundColor() -> UIColor {
        return UIColor.black.alpha(0.95)
    }
    
    public func setWaitingIndicatorBackgroundColor() -> UIColor {
        return UIColor.white.alpha(0.1)
    }
    
    public func setWaitingTitleColor() -> UIColor {
        return UIColor.white
    }
    
    public func setWaitingTitleFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    public func startWaiting(_ title: String? = nil)  {
        guard let topMostViewController: UIViewController = UIViewController.topMostViewController() else { return }
        let waitingIndicater: WaitingHubViewController = WaitingHubViewController()
        
        waitingIndicater.view.backgroundColor = setWaitingBackgroundColor()
        waitingIndicater.activityIndicatorView.backgroundColor = setWaitingIndicatorBackgroundColor()
        waitingIndicater.titelLabel.textColor = setWaitingTitleColor()
        waitingIndicater.titelLabel.font = setWaitingTitleFont()
        
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
