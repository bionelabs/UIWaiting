# UIWaiting
- UIWaiting is a extend UIViewController give 2 function startWating and stopWaiting to make ViewWaiting at top current ViewController
- Easy to add to your project and remove it. 

## Demo
<img src="https://github.com/onebuffer/UIWaiting/blob/master/Resources/Demo.png" width="30%">

## Installation

### CocoaPods
CocoaPods is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate UIWaiting into your Xcode project using CocoaPods, specify it in your Podfile:

```swift
pod 'UIWaiting'
```

### How to use

```swift

import UIKit
import UIWaiting

class ViewController: UIViewController, UIWaitingViewExtend {

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

```

## Contact
- Email: caophuocthanh@gmail.com
- Site: https://onebuffer.com
- Linkedin: https://www.linkedin.com/in/caophuocthanh/
