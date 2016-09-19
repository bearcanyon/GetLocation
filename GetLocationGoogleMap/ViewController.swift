//
//  ViewController.swift
//  GetLocationGoogleMap
//
//  Created by KumagaiNaoki on 2016/09/14.
//  Copyright © 2016年 KumagaiNaoki. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var customView: View?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView = View(frame: self.view.frame)
        self.view.addSubview(customView!)
        customView?.currentLocationButton.addTarget(self, action: #selector(self.pushCurrentButton(_:)), forControlEvents: .TouchUpInside)
    }
    
    func pushCurrentButton(sender: UIButton) {
        let location = CurrentLocation()
        location.lm.delegate = location
    }
}

