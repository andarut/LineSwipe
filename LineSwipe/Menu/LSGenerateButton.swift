//
//  LSGenerateButton.swift
//  LineSwipe
//
//  Created by Daniil Belov on 17.05.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSGaneratorButton {
    var type: Int
    init(type t: Int) {
        type = t
    }
    
    var w = 146.0
    var h = 110.0
    
    var x = 0.0
    var y = 0.0
    
    func updateView(frame f: HEGameFrame, moveX: Double, moveY: Double, alpha a: Double, stars: Int) {
        var img = "gen4.png"
        if type == 1 {
            if stars >= 60 {
                img = "gen5.png"
            } else {
                img = "gen5block.png"
            }
        } else if type == 2 {
            if stars >= 200 {
                img = "gen6.png"
            } else {
                  img = "gen6block.png"
            }
        } else if type == 3 {
            img = "gen7.png"
        }  else if type == 4 {
            img = "gencontinue.png"
            w = 497
            h = 124
        }
        f.addImageToViewWithAlpha(img: img, xpos: x+moveX, ypos: y+moveY, w: w, h: h, alpha: CGFloat(a))
    }
    
    func touch(point p: HEPoint) -> Bool {
        var r = false
        if p.x > x && p.x < x + w && p.y > y && p.y < y + h {
            r = true
        }
        return r
    }
}
