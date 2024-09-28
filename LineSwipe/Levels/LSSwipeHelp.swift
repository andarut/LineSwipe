//
//  LSSwipeHelp.swift
//  LineSwipe
//
//  Created by Daniil Belov on 13.03.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSSwipeHelp {
    var targetX = 100.0
    var targetY = 400.0
    var startX = 100.0
    var startY = 600.0
    
    var x = 100.0
    var y = 600.0
    
    var animTic = 0
    
    var moveSpeed = 8.0
    
    func updateView(frame f: HEGameFrame, moveX xx: Double, moveY yy: Double) {
        //animation move
        if x > targetX {
            x -= (x - targetX) / moveSpeed
        }
        if x < targetX {
            x += (targetX - x) / moveSpeed
        }
        if y > targetY {
            y -= (y - targetY) / moveSpeed
        }
        if y < targetY {
            y += (targetY - y) / moveSpeed
        }
        
        //animation reset
        if animTic > 50 {
            x = startX
            y = startY
            animTic = 0
        } else {
            animTic += 1
        }
        
        //view
        f.addImageToView(img: "swipehelp.png", xpos: x+xx, ypos: y+yy, w: 73, h: 73)
        
    }
}
