//
//  LSSettingsSwitch.swift
//  LineSwipe
//
//  Created by Daniil Belov on 11.04.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSSettingsSwitch {
    var y = 0.0
    var moveY = 0.0
    var check = false
    var alpha = 1.0
    
    var text = "SWITCH"
    var color = UIColor.white
    
    var moveX = 0.0
    
    var pX = 449.0
    var pXT = 449.0
    var pOnAlpha = 0.0
    var pOffAlpha = 1.0
    func updateView(frame f: HEGameFrame) {
        if color == .black {
            f.addImageToViewWithAlpha(img: "bswitch.png", xpos: 437+moveX, ypos: y+moveY, w: 121, h: 66, alpha: CGFloat(alpha))
        } else {
            f.addImageToViewWithAlpha(img: "switch.png", xpos: 437+moveX, ypos: y+moveY, w: 121, h: 66, alpha: CGFloat(alpha))
        }
        if color == .black {
            f.addImageToViewWithAlpha(img: "bsoff.png", xpos: pX+moveX, ypos: 11+y+moveY, w: 43, h: 43, alpha: CGFloat(pOffAlpha))
            f.addImageToViewWithAlpha(img: "bson.png", xpos: pX+moveX, ypos: 11+y+moveY, w: 43, h: 43, alpha: CGFloat(pOnAlpha))
        } else {
            f.addImageToViewWithAlpha(img: "switchoff.png", xpos: pX+moveX, ypos: 11+y+moveY, w: 43, h: 43, alpha: CGFloat(pOffAlpha))
            f.addImageToViewWithAlpha(img: "switchon.png", xpos: pX+moveX, ypos: 11+y+moveY, w: 43, h: 43, alpha: CGFloat(pOnAlpha))
        }
        f.addTextToView(x: 302+90+moveX, y: 32+y+moveY, width: 600, height: 100, align: .left, font: "Lato", size: 35, color: color, text: text)
        
        //animation
        if check {
            if pOnAlpha <= 1 {
                pOnAlpha += 0.1
            } else {
                pOffAlpha = 0
            }
            pXT = 503
        } else {
            pOffAlpha = 1
            if pOnAlpha >= 0 {
                pOnAlpha -= 0.1
            }
            pXT = 449
        }
        if pX < pXT {
            pX += (pXT - pX)/6
        }
        if pX > pXT {
            pX -= (pX - pXT)/6
        }
    }
    func compareTouch(point p: HEPoint) {
        if p.x > 437 && p.x < 437 + 121 && p.y > y && p.y < y + 66 {
            if check {
                check = false
            } else {
                check = true
            }
        }
    }
}
