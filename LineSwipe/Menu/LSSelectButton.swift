//
//  LSSelectButton.swift
//  LineSwipe
//
//  Created by Daniil Belov on 13.05.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSSelectButton {
    var y = 0.0
    var moveY = 0.0
    var check = false
    var alpha = 1.0
    
    var text = "SWITCH"
    
    func updateView(frame f: HEGameFrame) {
        if check {
            f.addImageToViewWithAlpha(img: "radioEnable.png", xpos: 515, ypos: y+moveY, w: 43, h: 43, alpha: CGFloat(alpha))
        } else {
            f.addImageToViewWithAlpha(img: "radioDisable.png", xpos: 515, ypos: y+moveY, w: 43, h: 43, alpha: CGFloat(alpha))
        }
        f.addTextToView(x: 302+90, y: 20+y+moveY, width: 600, height: 100, align: .left, font: "Lato", size: 35, color: .white, text: text)
    }
    
    func touch(point p: HEPoint) -> Bool {
        var r = false
        if p.x > 437 && p.x < 437 + 121 && p.y > y && p.y < y + 66 {
            r = true
        }
        return r
    }
}
