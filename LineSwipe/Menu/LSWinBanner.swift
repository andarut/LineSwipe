//
//  LSWinBanner.swift
//  LineSwipe
//
//  Created by Daniil Belov on 15.04.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSWinBanner {
    var langs = LSLanguage()
    
    var width = 475.0
    var height = 347.0
    
    var movY = 0.0
    
    var scale = -0.8
    
    var alpha = 1.0
    var balpha = 0.0
    var delay = 0
    
    var ws1 = 0.0
    var ws2 = 0.0
    var ws3 = 0.0
    
    var tic = 0         
    
    var winType = 1
    
    var notComplete = false
    var timeMode = false
    
    let save = UserDefaults.standard
    
    var s1 = "ws1.png"
    var s2 = "ws2.png"
    var s3 = "ws3.png"
    
    func updateView(frame f: HEGameFrame) {
        if !save.bool(forKey: "settings.animation") {
            scale = 1
            if tic > 10 {
                if winType <= 3 {
                    ws1 = 1
                }
            }
            if tic > 20 {
                if winType <= 2 {
                    ws2 = 1
                }
            }
            if tic > 30 {
                if winType <= 1 {
                    ws3 = 1
                }
            }
        }
        f.addImageToViewWithAlpha(img: "dark.png", xpos: 0, ypos: 0 + movY, w: 640, h: 1136, alpha: CGFloat(balpha))
        if scale >= 0 {
            if notComplete {
                if timeMode {
                    f.addImageToViewWithAlpha(img: langs.langs[LSLanguage.lang][6], xpos: (640 / 2) - ((width * scale) / 2), ypos: (1136 / 2) - ((height * scale) / 2) + movY, w: width * scale, h: height * scale, alpha: CGFloat(alpha))
                } else {
                    f.addImageToViewWithAlpha(img: langs.langs[LSLanguage.lang][5], xpos: (640 / 2) - ((width * scale) / 2), ypos: (1136 / 2) - ((height * scale) / 2) + movY, w: width * scale, h: height * scale, alpha: CGFloat(alpha))
                }
                f.addImageToView(img: "level_fail.png", xpos: 538, ypos: 77+movY, w: 31, h: 31)
            } else {
                if winType == 1 {
                    f.addImageToViewWithAlpha(img: langs.langs[LSLanguage.lang][2], xpos: (640 / 2) - ((width * scale) / 2), ypos: (1136 / 2) - ((height * scale) / 2) + movY, w: width * scale, h: height * scale, alpha: CGFloat(alpha))
                }
                if winType == 2 {
                    f.addImageToViewWithAlpha(img: langs.langs[LSLanguage.lang][3], xpos: (640 / 2) - ((width * scale) / 2), ypos: (1136 / 2) - ((height * scale) / 2) + movY, w: width * scale, h: height * scale, alpha: CGFloat(alpha))
                }
                if winType == 3 {
                    f.addImageToViewWithAlpha(img: langs.langs[LSLanguage.lang][4], xpos: (640 / 2) - ((width * scale) / 2), ypos: (1136 / 2) - ((height * scale) / 2) + movY, w: width * scale, h: height * scale, alpha: CGFloat(alpha))
                }
                f.addImageToView(img: "lvl_complete.png", xpos: 530, ypos: 81+movY, w: 39, h: 27)
                f.addImageToViewWithAlpha(img: s1, xpos: 164 - ((93*ws1)/2)+50, ypos: 589 - ((93*ws1)/2)+46 + movY, w: 93*ws1, h: 93*ws1, alpha: CGFloat(balpha))
                f.addImageToViewWithAlpha(img: s2, xpos: 271 - ((93*ws2)/2)+50, ypos: 589 - ((93*ws2)/2)+46 + movY, w: 93*ws2, h: 93*ws2, alpha: CGFloat(balpha))
                f.addImageToViewWithAlpha(img: s3, xpos: 378 - ((93*ws3)/2)+50, ypos: 589 - ((93*ws3)/2)+46 + movY, w: 93*ws3, h: 93*ws3, alpha: CGFloat(balpha))
            }
        }
        f.addImageToViewWithAlpha(img: "alarm.png", xpos: 79, ypos: 287 + movY, w: 45, h: 49, alpha: CGFloat(balpha))
        f.addImageToViewWithAlpha(img: "steps.png", xpos: 294, ypos: 286 + movY, w: 36, h: 50, alpha: CGFloat(balpha))
        if delay != 0 {
            delay -= 1
        }
        if tic < 100 {
            balpha += 0.1
        } else {
            alpha -= 0.1
            balpha -= 0.1
        }
        if tic > 80 && tic < 100 {
            balpha = 1
        }
        
        if tic > 10 {
            if winType <= 3 {
                ws1 += (1-ws1)/4
            }
        }
        if tic > 20 {
            if winType <= 2 {
                ws2 += (1-ws2)/4
            }
        }
        if tic > 30 {
            if winType <= 1 {
                ws3 += (1-ws3)/4
            }
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
    }
}
