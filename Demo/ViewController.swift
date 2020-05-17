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
    
    func setWaitingTitleFont() -> UIFont {
        return .boldSystemFont(ofSize: 18)
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
        // Do any additional setup after loading the view.
        
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
    }
    
    @objc func tap() {
        self.startWaiting("PROCESSING")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.stopWaiting()
        }
    }
}

