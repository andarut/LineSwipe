//
//  LSBanners.swift
//  LineSwipe
//
//  Created by Daniil Belov on 19.06.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class CHAdBaneer {
    var picture = "vkbonus.png"
    var bS = 0
    
    func updateView(f: HEGameFrame) {
        f.addImageToView(img: picture, xpos: 0, ypos: 0, w: 640, h: 1136)
    }
    
    func compareTouch(p: HEPoint, v: ViewController) {
        if p.x > 521 && p.x < 521 + 109 && p.y > 1 && p.y < 1+124 {
            close(v: v)
        }
        if p.x > 97 && p.x < 97+468 && p.y > 885 && p.y < 885+124 {
            link(v: v)
        }
    }
    
    func link(v: ViewController) {
        if bS == 0 {
            bS = 1
            if let url = URL(string: "https://vk.com/cutiehearth") {
                UIApplication.shared.open(url, options: [:]) {
                    boolean in
                    // do something with the boolean
                }
            }
            v.save.set(v.save.integer(forKey: "dmoney")+100, forKey: "dmoney")
            v.save.set(v.save.integer(forKey: "dgems")+10, forKey: "dgems")
            v.save.set(true, forKey: "vkShowed")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.20, execute: {
                self.updateOK()
            })
        } else {
            v.gameState = 0
            v.startMenu.menuState = 15
        }
    }
    func updateOK() {
        picture = "vkOK.png"
    }
    func close(v: ViewController) {
        v.gameState = 1
        v.save.set(true, forKey: "vkShowed")
    }
}
