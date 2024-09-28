//
//  LSMoneyBanner.swift
//  LineSwipe
//
//  Created by Daniil Belov on 13.06.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSMoneyBenner {
    var y = -100.0
    var yT = -100.0
    var view = false
    var vTic = 0
    
    var m = 0
    var g = 0
    
    var bonusGived = false
    
    func updateView(frame f: HEGameFrame, v: ViewController) {
        if view {
            vTic += 1
            if vTic < 125 {
                yT = 145
                bonusGived = false
            } else {
                yT = -120
            }
            if y < -100 {
                view = false
                y = -100
                yT = -100
                if !bonusGived {
                    v.save.set(v.save.integer(forKey: "dmoney")+m, forKey: "dmoney")
                    v.save.set(v.save.integer(forKey: "dgems")+g, forKey: "dgems")
                    bonusGived = true
                }
            }
            f.addImageToViewWithAlpha(img: "moneycounter.png", xpos: 77, ypos: y, w: 497, h: 67, alpha: 1)
            f.addTextToView(x: -38, y: 30+y, width: 800, height: 214, align: .right, font: "Lato-Light", size: 40, color: .black, text: "\(v.save.integer(forKey: "dmoney"))+\(m)")
            f.addTextToView(x: 150, y: 30+y, width: 800, height: 214, align: .right, font: "Lato-Light", size: 40, color: .black, text: "\(v.save.integer(forKey: "dgems"))+\(g)")
            
            //animation
            if y > yT {
                y -= (y - yT)/6
            }
            if y < yT {
                y += (yT - y)/6
            }
        }
    }
    
    func viewBar(money: Int, gems: Int) {
        view = true
        m = money
        g = gems
    }
}
