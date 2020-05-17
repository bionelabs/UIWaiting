//
//  ViewController.swift
//  Demo
//
//  Created by Cao Phuoc Thanh on 5/17/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIWaiting

extension ViewController: UIWaitingViewExtend {
    
    // MARK: Custom UI waiting view
    internal func setWaitingTitleFont() -> UIFont {
        return .boldSystemFont(ofSize: 18)
    }
    
    internal  func setWaitingIndicatorBackgroundColor() -> UIColor {
        return UIColor.red.withAlphaComponent(0.1)
    }
    
    internal  func setWaitingBackgroundColor() -> UIColor {
        return UIColor.black.withAlphaComponent(0.1)
    }
    
    internal  func setWaitingTitleColor() -> UIColor {
        return .black
    }
    
}

class ViewController: UIViewController {
    
    let button: UIButton = {
        let view: UIButton = UIButton()
        view.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.backgroundColor = .orange
        view.setTitle("SHOW", for: .normal)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
    }
    
    // Show Waiting
    @objc func tap() {
        self.startWaiting("PROCESSING")
        
        // Hide Waiting
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.stopWaiting()
        }
    }
}

