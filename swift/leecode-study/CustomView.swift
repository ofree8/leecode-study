//
//  CustomView.swift
//  leecode-study
//
//  Created by fei ye on 2019/2/11.
//  Copyright © 2019 fei ye. All rights reserved.
//

import UIKit

class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func display(_ layer: CALayer) {
        layer.contents = UIImage(named: "TestImg")?.cgImage
    }

    override func draw(_ rect: CGRect) {
        layer.contents = UIImage(named: "TestImg")?.cgImage
    }

}
