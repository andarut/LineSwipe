//
//  LSRestartPanel.swift
//  LineSwipe
//
//  Created by Daniil Belov on 18.04.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSRestartPanel {
    var langs = LSLanguage()
    
    var width = 475.0
    var height = 263.0
    
    var movY = 0.0
    
    var scale = -0.4
    
    var alpha = 1.0
    var balpha = 0.0
    var delay = 0
    
    var tic = 0
    
    var view = false
    
    var yX = 222.0
    var yY = 589.0
    
    var nX = 330.0
    var nY = 589.0
    
    var btnS = 81.0
    var btnA = 0.0
    
    
    func updateView(frame f: HEGameFrame) {
        if view {
            f.addImageToViewWithAlpha(img: "dark.png", xpos: 0, ypos: 0 + movY, w: 640, h: 1136, alpha: CGFloat(balpha))
            f.addImageToViewWithAlpha(img: langs.langs[LSLanguage.lang][8], xpos: (640 / 2) - ((width * scale) / 2), ypos: (1136 / 2) - ((height * scale) / 2) + movY, w: width * scale, h: height * scale, alpha: CGFloat(alpha))
            f.addImageToViewWithAlpha(img: "yes.png", xpos: yX, ypos: yY, w: btnS, h: btnS, alpha: CGFloat(btnA))
            f.addImageToViewWithAlpha(img: "no.png", xpos: nX, ypos: nY, w: btnS, h: btnS, alpha: CGFloat(btnA))
            if tic < 10 {
                balpha += 0.1
            } else {
                btnA += 0.1
            }
            tic += 1
            if delay == 0 {
                if scale < 1.0 {
                    scale += ((1.0 - scale) / 6) + 0.4
                }
                if scale > 1.0 {
                    scale -= (scale - 1.0) / 6
                }
            }
        } else {
            if balpha > 0 {
                f.addImageToViewWithAlpha(img: "dark.png", xpos: 0, ypos: 0 + movY, w: 640, h: 1136, alpha: CGFloat(balpha))
                f.addImageToViewWithAlpha(img: langs.langs[LSLanguage.lang][8], xpos: (640 / 2) - ((width * scale) / 2), ypos: (1136 / 2) - ((height * scale) / 2) + movY, w: width * scale, h: height * scale, alpha: CGFloat(alpha))
                f.addImageToViewWithAlpha(img: "yes.png", xpos: yX, ypos: yY, w: btnS, h: btnS, alpha: CGFloat(btnA))
                f.addImageToViewWithAlpha(img: "no.png", xpos: nX, ypos: nY, w: btnS, h: btnS, alpha: CGFloat(btnA))
                alpha -= 0.1
                balpha -= 0.1
                btnA -= 0.1
                scale -= 0.1
            } else {
                scale = -0.4
                
                alpha = 1.0
                balpha = 0.0
                delay = 0
                btnA = 0.0
                tic = 0
            }
        }
    }
    
    func compareTouch(point p: HEPoint, view v: ViewController) {
        if view {
            //yes
            if p.x > yX && p.x < yX + btnS && p.y > yY && p.y < yY + btnS {
                if v.save.integer(forKey: "energy") > 0 {
                    v.restartLevel()
                    view = false
                    v.save.set(v.save.integer(forKey: "energy")-1, forKey: "energy")
                } else {
                    view = false
                    v.lvl.lvlTurn = true
                    v.energyBanner.viewPanel()
                }
            }
            if p.x > nX && p.x < nX + btnS && p.y > nY && p.y < nY + btnS {
                view = false
            }
        }
    }
    
    func viewPanel() {
        view = true
    }
}

