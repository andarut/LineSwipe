//
//  LSMenuButton.swift
//  LineSwipe
//
//  Created by Daniil Belov on 10.05.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSMenuButton {
    var type: Int
    init(type t: Int) {
        type = t
    }
    
    var w = 116.0
    var h = 116.0
    
    var x = 0.0
    var y = 0.0
    
    func updateView(frame f: HEGameFrame, moveX: Double, moveY: Double, alpha a: Double) {
        var img = "btn_settings.png"
        if type == 1 {
            img = "btn_stats"
        } else if type == 2 {
            img = "shop"
        }
        f.addImageToViewWithAlpha(img: img, xpos: x+moveX, ypos: y+moveY, w: w, h: h, alpha: CGFloat(a))
    }
    
    func compareTouch(point p: HEPoint, view v: ViewController) {
        if p.x > x && p.x < x + w && p.y > y && p.y < y + h {
            if type == 0 {
                v.startMenu.menuState = 4
                v.startMenu.dA = 1
            }
            if type == 1 {
                v.openGC()
            }
            if type == 2 {
//                let shareview = UIActivityViewController(activityItems: ["https://vk.com/cutiehearth"], applicationActivities: nil)
//                shareview.popoverPresentationController?.sourceView = v.view
//                v.present(shareview, animated: true, completion: nil)
                v.startMenu.menuState = 15
                v.startMenu.dA = 1
            }
        }
    }
}
