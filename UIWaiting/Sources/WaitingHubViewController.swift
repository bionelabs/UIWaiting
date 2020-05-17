//
//  WaitingHubViewController.swift
//  UIWatingViewController
//
//  Created by Cao Phuoc Thanh on 5/16/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class WaitingHubViewController: UIViewController {
    
    var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.style = .white
        view.startAnimating()
        view.backgroundColor = UIColor.white.alpha(0.1)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    var titelLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textColor = UIColor.white
        return view
    }()
    
    private var subtitelLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.textColor = UIColor.white.alpha(0.8)
        return view
    }()
    
    override var title: String? {
        didSet{
            self.titelLabel.text = title
        }
    }
    
    var subtitle: String? {
        didSet{
            subtitelLabel.text = subtitle
        }
    }
    
    override func loadView() {
        super.loadView()
        // setup
        self.view.backgroundColor = UIColor.black.alpha(0.95)
        
        // subviews
        self.view.addSubview(activityIndicatorView)
        self.view.addSubview(titelLabel)
        self.view.addSubview(subtitelLabel)
        
        // constraint
        self.view.visual.center([.vertical, .horizontal], for: activityIndicatorView)
        self.view.visual.anchor([.horizontal], for: titelLabel, padding: 16)
        self.view.visual.anchor([.horizontal], for: subtitelLabel, padding: 16)
        
        self.view.visual.format("V:[v0(80)]-16-[v1]-[v2]", for: [activityIndicatorView,
                                                                 titelLabel,
                                                                 subtitelLabel])
        self.view.visual.format("H:[v0(80)]", for: [activityIndicatorView])
    }

}
