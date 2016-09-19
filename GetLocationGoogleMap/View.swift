//
//  View.swift
//  GetLocationGoogleMap
//
//  Created by KumagaiNaoki on 2016/09/14.
//  Copyright © 2016年 KumagaiNaoki. All rights reserved.
//

import UIKit

class View: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var currentLocationButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        NSBundle.mainBundle().loadNibNamed("View", owner: self, options: nil)
        contentView.frame = frame
        addSubview(contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
