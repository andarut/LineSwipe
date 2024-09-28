//
//  LSEnergyBanner.swift
//  LineSwipe
//
//  Created by Daniil Belov on 12.06.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSEnergyBanner {
    var langs = LSLanguage()
    let save = UserDefaults.standard
    var width = 475.0
    var height = 346.0
    
    var movY = 0.0
    
    var scale = -0.4
    
    var alpha = 1.0
    var balpha = 0.0
    var delay = 0
    
    var tic = 0
    
    var view = false
    
    var yX = 195.0
    var yY = 618.0
    
    var nX = 326.0
    var nY = 618.0
    
    var btnS = 108.0
    var btnA = 0.0
    
    
    func updateView(frame f: HEGameFrame, v: ViewController) {
        if view {
            var timeView = "00:00"
            let minView = v.etic / 60
            let secView = v.etic % 60
            if secView >= 10 {
                if minView >= 10 {
                    timeView = String(minView)+":"+String(secView)
                } else {
                    timeView = "0"+String(minView)+":"+String(secView)
                }
            } else {
                if minView >= 10 {
                    timeView = String(minView)+":0"+String(secView)
                } else {
                    timeView = "0"+String(minView)+":0"+String(secView)
                }
            }
            if save.integer(forKey: "eMin") > 1 {
                save.set(8, forKey: "energy")
            }
            f.addImageToViewWithAlpha(img: "dark.png", xpos: 0, ypos: 0 + movY, w: 640, h: 1136, alpha: CGFloat(balpha))
            f.addImageToViewWithAlpha(img: langs.mLangs[LSLanguage.lang][15], xpos: (640 / 2) - ((width * scale) / 2), ypos: (1136 / 2) - ((height * scale) / 2) + movY, w: width * scale, h: height * scale, alpha: CGFloat(alpha))
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
            
            f.addTextToView(x: 320, y: 800, width: 800, height: 214, align: .center, font: "Lato-Light", size: 40, color: .white, text: "\(langs.mLangs[LSLanguage.lang][13])")
            f.addTextToView(x: 320, y: 850, width: 800, height: 214, align: .center, font: "Lato-Light", size: 40, color: .white, text: "\(langs.mLangs[LSLanguage.lang][14])")
            f.addTextToView(x: 320, y: 900, width: 800, height: 214, align: .center, font: "Lato-Light", size: 40, color: .white, text: "\(timeView)")
        } else {
            if balpha > 0 {
                f.addImageToViewWithAlpha(img: "dark.png", xpos: 0, ypos: 0 + movY, w: 640, h: 1136, alpha: CGFloat(balpha))
                f.addImageToViewWithAlpha(img: langs.mLangs[LSLanguage.lang][15], xpos: (640 / 2) - ((width * scale) / 2), ypos: (1136 / 2) - ((height * scale) / 2) + movY, w: width * scale, h: height * scale, alpha: CGFloat(alpha))
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
                view = false
                v.startRewardVideo()
                LSStart.rewardType = 1
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

