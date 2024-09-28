//
//  LSHelpPage.swift
//  LineSwipe
//
//  Created by Daniil Belov on 12.05.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSPage {
    var picture = "1.png"
    var x = 0.0
    var targetX = 0.0
    
    init(picture p: String) {
        picture = p
    }
    
    var speed = 6.0
    
    func updateView(frame f: HEGameFrame) {
        if x < targetX {
            x += (targetX - x)/speed
        }
        if x > targetX {
            x -= (x - targetX)/speed
        }
        f.addImageToViewWithAlpha(img: picture, xpos: x, ypos: 0, w: 640, h: 1136, alpha: 1)
    }
}
