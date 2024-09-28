//
//  HEPoint.swift
//  LineSwipe
//
//  Created by Daniil Belov on 11.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class HEPoint {
    var x = 0.0
    var y = 0.0
    
    func showPoint(frame: HEGameFrame) {
        frame.addImageToView(img: "point.png", xpos: x, ypos: y, w: 2, h: 2)
    }
}
