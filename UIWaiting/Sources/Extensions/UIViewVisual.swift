//
//  UIViewVisual.swift
//  UIWatingViewController
//
//  Created by Cao Phuoc Thanh on 5/16/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

internal extension UIView {
    
    enum LayoutAttributeSize: Int {
        case width
        case height
    }
    
    enum LayoutAttributeAlign: Int {
        case horizontal
        case vertical
    }
    
    enum LayoutAttributeAnchor: Int {
        case horizontal
        case vertical
        case left
        case right
        case top
        case bottom
    }
    
    class Visual {
                
        private let _view: UIView
        var contraints: [NSLayoutConstraint] = []
        
        init(_ view: UIView) {
            self._view = view
        }
        
        // visual.center
        // atributes all:[.vertical, .horizontal]
        // atributes vertical:[.vertical]
        // atributes horizontal:[.horizontal]
        @discardableResult func center(_ atributes: [UIView.LayoutAttributeAlign], for view: UIView) -> Visual {
            var _constraints: [NSLayoutConstraint] = []
            atributes.forEach { (atribute) in
                switch atribute {
                case .horizontal:
                    _constraints += [NSLayoutConstraint(
                        item: view,
                        attribute: .centerX, relatedBy: .equal,
                        toItem: _view, attribute: .centerX,
                        multiplier: 1.0, constant: 0.0)]
                case .vertical:
                    _constraints += [NSLayoutConstraint(
                        item: view,
                        attribute: .centerY, relatedBy: .equal,
                        toItem: _view, attribute: .centerY,
                        multiplier: 1.0, constant: 0.0)]
                }
            }
            _view.addConstraints(_constraints)
            self.contraints += _constraints
            return self
        }
        
        @discardableResult func anchor(_ atributes: [UIView.LayoutAttributeAnchor], for view: UIView, padding: CGFloat = 8) -> Visual {
            var _constraints: [NSLayoutConstraint] = []
            atributes.forEach { (atribute) in
                switch atribute {
                case .left:
                    let views = ["view": view]
                    let metrics = ["padding": padding]
                    let format = "H:|-(padding)-[view]"
                    let __constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views)
                    _view.addConstraints(__constraints)
                    _constraints += __constraints
                case .right:
                    let views = ["view": view]
                    let metrics = ["padding": padding]
                    let format = "H:[view]-(padding)-|"
                    let __constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views)
                    _view.addConstraints(__constraints)
                    _constraints += __constraints
                case .top:
                    let views = ["view": view]
                    let metrics = ["padding": padding]
                    let format = "V:|-(padding)-[view]"
                    let __constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views)
                    _view.addConstraints(__constraints)
                    _constraints += __constraints
                case .bottom:
                    let views = ["view": view]
                    let metrics = ["padding": padding]
                    let format = "V:[view]-(padding)-|"
                    let __constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views)
                    _view.addConstraints(__constraints)
                    _constraints += __constraints
                case .vertical:
                    let views = ["view": view]
                    let metrics = ["padding": padding]
                    let format = "V:|-(padding)-[view]-(padding)-|"
                    let __constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views)
                    _view.addConstraints(__constraints)
                    _constraints += __constraints
                case .horizontal:
                    let views = ["view": view]
                    let metrics = ["padding": padding]
                    let format = "H:|-(padding)-[view]-(padding)-|"
                    let __constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views)
                    _view.addConstraints(__constraints)
                    _constraints += __constraints
                }
            }
            _view.addConstraints(_constraints)
            self.contraints += _constraints
            return self
        }
        
        @discardableResult func format(_ format: String, metrics: [String: CGFloat] = [:], for views: [UIView]) -> Visual {
            var inViews: [String: UIView] = [:]
            for (index, item) in views.enumerated() {
                inViews["v\(index)"] = item
            }
            let _constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: inViews)
            _view.addConstraints(_constraints)
            self.contraints += _constraints
            return self
        }
        
        @discardableResult func equal(_ attribute: UIView.LayoutAttributeSize, fromView: UIView, toView: UIView ) -> Visual {
            switch attribute {
            case .height:
                let constraint = NSLayoutConstraint(item: fromView, attribute: .width, relatedBy: .equal, toItem: toView, attribute: .width, multiplier: 1.0, constant: 0.0)
                _view.addConstraint(constraint)
                self.contraints += [constraint]
                return self
            case .width:
                let constraint = NSLayoutConstraint(item: fromView, attribute: .width, relatedBy: .equal, toItem: toView, attribute: .width, multiplier: 1.0, constant: 0.0)
                _view.addConstraint(constraint)
                self.contraints += [constraint]
                return self
            }
        }
        
        public func square(_ attribute: UIView.LayoutAttributeSize, constant: CGFloat? = nil) {
            switch attribute {
            case .height:
                if let constant = constant {
                    let widthConstraint = NSLayoutConstraint(
                        item: _view,
                        attribute: NSLayoutConstraint.Attribute.height,
                        relatedBy: NSLayoutConstraint.Relation.equal,
                        toItem: nil,
                        attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                        multiplier: 1,
                        constant: constant
                    )
                    _view.addConstraint(widthConstraint)
                    self.contraints += [widthConstraint]
                }
                let constraint = NSLayoutConstraint(item: _view, attribute: .width, relatedBy: .equal, toItem: _view, attribute: .height, multiplier: 1.0, constant: 0.0)
                _view.addConstraint(constraint)
                self.contraints += [constraint]
            case .width:
                if let constant = constant {
                    let widthConstraint = NSLayoutConstraint(
                        item: _view,
                        attribute: NSLayoutConstraint.Attribute.width,
                        relatedBy: NSLayoutConstraint.Relation.equal,
                        toItem: nil,
                        attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                        multiplier: 1,
                        constant: constant
                    )
                    _view.addConstraint(widthConstraint)
                    self.contraints += [widthConstraint]
                }
                let constraint = NSLayoutConstraint(item: _view, attribute: .height, relatedBy: .equal, toItem: _view, attribute: .width, multiplier: 1.0, constant: 0.0)
                _view.addConstraint(constraint)
                self.contraints += [constraint]
            }
        }
        
        @discardableResult func size(_ atributes: [UIView.LayoutAttributeSize], for view: UIView, constant: CGFloat) -> Visual {
            var _constraints: [NSLayoutConstraint] = []
            atributes.forEach { (atribute) in
                switch atribute {
                case .height:
                    let constraint = NSLayoutConstraint(
                        item: view,
                        attribute: NSLayoutConstraint.Attribute.height,
                        relatedBy: NSLayoutConstraint.Relation.equal,
                        toItem: nil,
                        attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                        multiplier: 1,
                        constant: constant
                    )
                    _constraints += [constraint]
                case .width:
                    let constraint = NSLayoutConstraint(
                        item: view,
                        attribute: NSLayoutConstraint.Attribute.height,
                        relatedBy: NSLayoutConstraint.Relation.equal,
                        toItem: nil,
                        attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                        multiplier: 1,
                        constant: constant
                    )
                    _constraints += [constraint]
                }
            }
            _view.addConstraints(_constraints)
            self.contraints += _constraints
            return self
        }
        
    }
    
    var visual : Visual {
        get{
            return Visual(self)
        }
    }
}
