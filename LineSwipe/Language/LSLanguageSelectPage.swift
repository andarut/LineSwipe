//
//  LSLanguageSelectPage.swift
//  LineSwipe
//
//  Created by Daniil Belov on 13.06.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSLanguageSelectPage {
    var startAnim = false
    var pA = 1.0
    var lA = 0.0
    
    func updateView(frame f: HEGameFrame, v: ViewController) {
        if !v.save.bool(forKey: "langselected") {
            f.addImageToViewWithAlpha(img: "startlangelect.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(pA))
            v.save.set(5, forKey: "energy")
        } else {
            f.addImageToViewWithAlpha(img: "slogo35.jpg", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: 1)
            startAnim = true
        }
        f.addImageToViewWithAlpha(img: "slogo35.jpg", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(lA))
        if startAnim {
            if pA >= 0 {
                pA -= 0.1
            } else {
                pA = 0
                lA += 0.1
                if lA >= 1 {
                    v.gameState = 0
                    v.save.set(true, forKey: "langselected")
                }
            }
        }
    }
    
    func selectLang(lang l: Int, v: ViewController) {
        v.save.set(l, forKey: "settings.lang")
        LSLanguage.lang = l
        startAnim = true
    }
    
    func compareTouch(point p: HEPoint, v: ViewController) {
        if p.x > 127 && p.x < 127 + 358 && p.y > 372 && p.y < 372 + 120 {
            selectLang(lang: 0, v: v)
        }
        if p.x > 127 && p.x < 127 + 358 && p.y > 508 && p.y < 508 + 120 {
            selectLang(lang: 1, v: v)
        }
        if p.x > 127 && p.x < 127 + 358 && p.y > 644 && p.y < 372 + 120 {
            selectLang(lang: 2, v: v)
        }
    }
}
