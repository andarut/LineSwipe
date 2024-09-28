//
//  LSTutorial.swift
//  LineSwipe
//
//  Created by Daniil Belov on 21.05.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSTutorial {
    var tutorialState = 0;
    var stateStep = 0
    
    var tt1y = 280.0
    var tt1yt = 349.0
    var tt1a = 0.0
    
    var tt2y = 280.0
    var tt2yt = 349.0
    var tt2a = 0.0
    
    var ts1x = 69.0
    var ts1xT = -98.0
    
    var ts2y = 192.0
    var ts2yT = 359.0
    
    var tsh1x = 405.0
    var tsh1xT = 172.0
    var tsh1tic = 0
    
    var tsh2y = 452.0
    var tsh2yT = 686.0
    var tsh2tic = 0
    
    var sec = 0
    var steps = 4
    
    var tb1a = 0.0
    var scale = -0.8
    
    var d = 0
    var dbg = -12.0
    
    var sound = LSSounds()
    
    let langs = LSLanguage()
    
    func updateView(frame f: HEGameFrame, v: ViewController) {
        if tutorialState == 0 {
            f.addImageToViewWithAlpha(img: "tl1.png", xpos: 69, ypos: 357, w: 504, h: 502, alpha: 1)
            if stateStep == 2 {
                f.addImageToViewWithAlpha(img: "ts1.png", xpos: ts1x, ypos: 358, w: 670, h: 169, alpha: 1)
                f.addImageToViewWithAlpha(img: "tmp1.png", xpos: 69, ypos: 357, w: 502, h: 502, alpha: 1)
                f.addImageToViewWithAlpha(img: langs.mLangs[LSLanguage.lang][8], xpos: 70, ypos: 525, w: 501, h: 334, alpha: 1)
                f.addImageToViewWithAlpha(img: "tsh1.png", xpos: tsh1x, ypos: 412, w: 68, h: 61, alpha: 1)
                tsh1x -= (tsh1x - tsh1xT)/10
                if tsh1tic > 85 {
                    tsh1x = 405.0
                    tsh1tic = 0
                } else {
                    tsh1tic += 1
                }
            }
            if stateStep == 3 {
                f.addImageToViewWithAlpha(img: "ts1.png", xpos: ts1x, ypos: 358, w: 670, h: 169, alpha: 1)
                ts1x -= (ts1x - ts1xT)/4
                f.addImageToViewWithAlpha(img: "ts2.png", xpos: 68, ypos: ts2y, w: 171, h: 667, alpha: 1)
                f.addImageToViewWithAlpha(img: "tmp2.png", xpos: 69, ypos: 357, w: 502, h: 502, alpha: 1)
                f.addImageToViewWithAlpha(img: "tst2.png", xpos: 237, ypos: 357, w: 334, h: 502, alpha: 1)
                f.addImageToViewWithAlpha(img: "tsh2.png", xpos: 122, ypos: tsh2y, w: 61, h: 68 , alpha: 1)
                tsh2y += (tsh2yT - tsh2y)/10
                if tsh2tic > 85 {
                    tsh2y = 452.0
                    tsh2tic = 0
                } else {
                    tsh2tic += 1
                }
            }
            if stateStep == 4 {
                f.addImageToViewWithAlpha(img: "ts1.png", xpos: ts1x, ypos: 358, w: 670, h: 169, alpha: 1)
                ts1x -= (ts1x - ts1xT)/4
                f.addImageToViewWithAlpha(img: "ts2.png", xpos: 68, ypos: ts2y, w: 171, h: 667, alpha: 1)
                ts2y += (ts2yT - ts2y)/4
                f.addImageToViewWithAlpha(img: "tmp3.png", xpos: 69, ypos: 357, w: 502, h: 502, alpha: 1)
            }
        }
        f.addImageToView(img: "lvlbg.png", xpos: 0, ypos: 0, w: 640, h: 1136)
        f.addImageToView(img: "alarm.png", xpos: 79, ypos: 287, w: 45, h: 49)
        f.addImageToView(img: "steps.png", xpos: 294, ypos: 286, w: 36, h: 50)
        var timeView = "00:00"
        let minView = sec / 60
        let secView = sec % 60
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
        f.addTextToView(x: 100+136, y: 18+298, width: 200, height: 100, align: .left, font: "Lato-Light", size: 46, color: .white, text: timeView)
        //steps level
        f.addTextToView(x: 100+340, y: 18+298, width: 200, height: 100, align: .left, font: "Lato-Light", size: 46, color: .white, text: String(steps))
        if tutorialState == 0 {
            f.addImageToView(img: "lvl-tutorial.png", xpos: 472, ypos: 234, w: 98, h: 98)
            if stateStep == 0 {
                let save = UserDefaults.standard
                save.set(false, forKey: "helpshowed2")
                f.addImageToViewWithAlpha(img: "tb1.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: 1)
                tt1y += (tt1yt - tt1y)/6
                if tt1a <= 1 {
                    tt1a += 0.1
                }
            } else {
                tt1y = 280
                tt1y -= (tt1y - tt1yt)/6
                if tt1a >= 0 {
                    tt1a -= 0.1
                }
            }
            if stateStep == 1 {
                f.addImageToViewWithAlpha(img: "tb2.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: 1)
                tt2y += (tt2yt - tt2y)/6
                if tt2a <= 1 {
                    tt2a += 0.1
                }
            } else {
                tt2y = 280
                tt2y -= (tt2y - tt2yt)/6
                if tt2a >= 0 {
                    tt2a -= 0.1
                }
            }
            f.addImageToViewWithAlpha(img: langs.mLangs[LSLanguage.lang][6], xpos: 133, ypos: tt1y, w: 459, h: 186, alpha: CGFloat(tt1a))
            f.addImageToViewWithAlpha(img: langs.mLangs[LSLanguage.lang][7], xpos: 133, ypos: tt2y, w: 459, h: 186, alpha: CGFloat(tt2a))
        }
        f.addTextToView(x: -80+397, y: 16+77, width: 500, height: 100, align: .center, font: "Lato-Black", size: 46, color: .white, text: langs.mLangs[LSLanguage.lang][9])
        if stateStep == 4 {
            f.addImageToViewWithAlpha(img: "tbok1.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(tb1a))
            if d > 20 {
                tb1a += 0.1
            }
            if scale >= 0 {
                f.addImageToViewWithAlpha(img: "tok1.png", xpos: (640*0.5)-((208*scale)*0.5), ypos: (1136*0.5)-((208*scale)*0.5), w: 208*scale, h: 208*scale, alpha: 1)
            }
            if d > 20 {
                if scale < 1.0 {
                    scale += ((1.0 - scale) / 6) + 0.4
                }
                if scale > 1.0 {
                    scale -= (scale - 1.0) / 6
                }
            } else {
                d += 1
                let save = UserDefaults.standard
                save.set(true, forKey: "helpshowed2")
                if !save.bool(forKey: "eG") {
                    save.set(8, forKey: "energy")
                    save.set(true, forKey: "eG")
                }
            }
            dbg += 0.1
            f.addImageToViewWithAlpha(img: "darkbg.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(dbg))
            if dbg >= 1 {
                v.startMenu.menuState = 1
            }
        }
    }
    
    func touch() {
        if tutorialState == 0 {
            if stateStep == -1 {
                stateStep += 1
            } else if stateStep == 0 {
                stateStep += 1
            } else if stateStep == 1 {
                stateStep += 1
            }
            
        }
    }
    
    func secUpdate() {
        sec += 1
    }
    
    func leftSwipe(point p: HEPoint) {
        if tutorialState == 0 {
            if stateStep == 2 {
                if p.y > 360 && p.y < 360 + 159 {
                    stateStep += 1
                    sound.swipe()
                    steps -= 1
                }
            }
        }
    }
    
    func downSwipe(point p: HEPoint) {
        if tutorialState == 0 {
            if stateStep == 3 {
                if p.x > 69 && p.x < 69 + 169 {
                    stateStep += 1
                    sound.swipe()
                    steps -= 1
                }
            }
        }
    }
}
