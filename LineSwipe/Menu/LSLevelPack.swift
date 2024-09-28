//
//  LSLevelPack.swift
//  LineSwipe
//
//  Created by Daniil Belov on 21.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSLevelPack {
    var langs = LSLanguage()
    
    let lvls = LSLevels()
    var pages = [LSLevelsPage]()
    
    var currentPage = 0
    
    var title = "pack0title.png"
    var tX = 207.0
    var tY = 58.0
    var tW = 368.0
    var tH = 51.0
    
    
    var StepSwitch = LSSettingsSwitch()
    var TimeSwitch = LSSettingsSwitch()
    var backButtonX = 62.0
    var backButtonY = 53.0
    var backButtonW = 62.0
    var backButtonH = 62.0
    
    var goBack = false
    
    var movY = 0.0
    
    
    var name = "Normal mode"
    
    var packState = 0
    
    
    //scroll
    var startPos = 0.0
    var startTouch = 0.0
    var currentTouch = 0.0
    var endSpeed = 0.0
    
    var pEndSpeed = 0.0
    
    var minY = 0.0
    
    var scrolTic = 0
    
    var gen4 = LSGaneratorButton(type: 0)
    var gen5 = LSGaneratorButton(type: 1)
    var gen6 = LSGaneratorButton(type: 2)
    var gen7 = LSGaneratorButton(type: 3)
    var genc = LSGaneratorButton(type: 4)
    
    var mix_s = LSSlider()
    
    let save = UserDefaults.standard
    
    var difficulty = 0
    var mode = 0
    var size = 4
    
    var backStarted = false
    var backX = 0.0
    var backXT = 640.0
    var backBA = 0.0
    var backTic = 0
    
    var eBack = false
    
    var gSG = false
    
    init() {
        pages = [
            LSLevelsPage(levels: [lvls.lvl0_1, lvls.lvl0_2, lvls.lvl0_3, lvls.lvl0_4, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1]),
            LSLevelsPage(levels: [lvls.lvl0_1, lvls.lvl0_2, lvls.lvl0_3, lvls.lvl0_4, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1]),
            LSLevelsPage(levels: [lvls.lvl0_1, lvls.lvl0_2, lvls.lvl0_3, lvls.lvl0_4, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1]),
        ]
    }
    
    init(pages p: [LSLevelsPage]) {
        pages = p
        gen4.x = 70
        gen4.y = 785
        
        gen5.x = 247
        gen5.y = 785
        
        gen6.x = 422
        gen6.y = 785
        
        gen7.x = 333
        gen7.y = 461
        
        genc.x = 70
        genc.y = 720
    }
    
    
    func updateView(frame f : HEGameFrame, mf: HEGameFrame, hf: HEGameFrame, view v: ViewController, bg b: LSBackgroundAnimation) {
        if !TimeSwitch.check && !StepSwitch.check {
            StepSwitch.check = true
        }
        if eBack {
            eBack = false
            v.startMenu.menuState = 1
            v.gameState = 0
        }
        //end scroll
        if endSpeed > 3 {
            movY += endSpeed
            endSpeed -= 4
        } else if endSpeed < -3 {
            movY += endSpeed
            endSpeed += 4
        } else {
            endSpeed = 0
        }
        if movY > 0 {
            movY -= movY/4
            if endSpeed > 5 {
                movY += endSpeed
                endSpeed -= 8
            } else if endSpeed < -5 {
                movY += endSpeed
                endSpeed += 8
            } else {
                endSpeed = 0
            }
        }
        if movY < minY {
            movY += (minY - movY) / 4
            if endSpeed > 5 {
                movY += endSpeed
                endSpeed -= 8
            } else if endSpeed < -5 {
                movY += endSpeed
                endSpeed += 8
            } else {
                endSpeed = 0
            }
        }
        //x move
        for i in 0...pages.count-1 {
            pages[i].moveY = movY
            pages[i].moveXTarget = Double(640 * (i - currentPage))
            pages[i].movY = Double(i * 900)
        }
        minY = Double(pages.count*900-700) * -1
        //view
        if packState == 0 {
            for i in pages {
                i.updateView(frame: f, mX: backX)
            }
        } else if packState == 1 {
            if save.string(forKey: "genlvl"+"savedBG") != nil {
                if LSLanguage.lang == 0 {
                    f.addImageToView(img: "gcontinue.png", xpos: 70+backX, ypos: 373, w: 497, h: 124)
                    f.addImageToView(img: "genrecreate.png", xpos: 70+backX, ypos: 518, w: 497, h: 124)
                }
                if LSLanguage.lang == 1 {
                    f.addImageToView(img: "gcontinue_ru.png", xpos: 70+backX, ypos: 373, w: 497, h: 124)
                    f.addImageToView(img: "genrecreate_ru.png", xpos: 70+backX, ypos: 518, w: 497, h: 124)
                }
            } else {
                //                gen4.updateView(frame: f, moveX: 0+backX, moveY: 0, alpha: 1, stars: save.integer(forKey: "gstars"))
                //                gen5.updateView(frame: f, moveX: 0+backX, moveY: 0, alpha: 1, stars: save.integer(forKey: "gstars"))
                //                gen6.updateView(frame: f, moveX: 0+backX, moveY: 0, alpha: 1, stars: save.integer(forKey: "gstars"))
                //mix_s.y = 500
                //mix_s.updateView(frame: f)
                //gen7.updateView(frame: f, moveX: 0, moveY: 0, alpha: 1)
                //genc.updateView(frame: f, moveX: 0+backX, moveY: 0, alpha: 1, stars: save.integer(forKey: "gstars"))
                StepSwitch.text = langs.sLangs[LSLanguage.lang][4]
                StepSwitch.y = 482
                StepSwitch.color = .black
                StepSwitch.moveX = backX
                //StepSwitch.updateView(frame: f)
                TimeSwitch.text = langs.sLangs[LSLanguage.lang][5]
                TimeSwitch.y = 567
                TimeSwitch.color = .black
                TimeSwitch.moveX = backX
                //TimeSwitch.updateView(frame: f)
                var pref = ""
                if LSLanguage.lang == 1 {
                    pref = "_ru"
                } else {
                    pref = ""
                }
                if difficulty == 0 {
                    f.addImageToViewWithAlpha(img: "easy1\(pref).png", xpos: 70+backX, ypos: 292, w: 156, h: 53, alpha: 1)
                }
                else {
                    f.addImageToViewWithAlpha(img: "easy0\(pref).png", xpos: 70+backX, ypos: 292, w: 156, h: 53, alpha: 1)
                }
                if difficulty == 1 {
                    f.addImageToViewWithAlpha(img: "normal1\(pref).png", xpos: 240+backX, ypos: 292, w: 156, h: 53, alpha: 1)
                }
                else {
                    f.addImageToViewWithAlpha(img: "normal0\(pref).png", xpos: 240+backX, ypos: 292, w: 156, h: 53, alpha: 1)
                }
                if difficulty == 2 {
                    f.addImageToViewWithAlpha(img: "hard1\(pref).png", xpos: 411+backX, ypos: 292, w: 156, h: 53, alpha: 1)
                }
                else {
                    f.addImageToViewWithAlpha(img: "hard0\(pref).png", xpos: 411+backX, ypos: 292, w: 156, h: 53, alpha: 1)
                }
                if mode == 0 {
                    f.addImageToView(img: "stepon\(pref)", xpos: 70+backX, ypos: 448, w: 243, h: 53)
                    f.addImageToView(img: "timeoff\(pref)", xpos: 324+backX, ypos: 448, w: 243, h: 53)
                } else {
                    f.addImageToView(img: "stepoff\(pref)", xpos: 70+backX, ypos: 448, w: 243, h: 53)
                    f.addImageToView(img: "timeon\(pref)", xpos: 324+backX, ypos: 448, w: 243, h: 53)
                }
                if size == 4 {
                    f.addImageToView(img: "4x4on", xpos: 70+backX, ypos: 602, w: 156, h: 53)
                    if save.integer(forKey: "gstars") >= 60 {
                        f.addImageToView(img: "5x5off", xpos: 240+backX, ypos: 602, w: 156, h: 53)
                    }
                    if save.integer(forKey: "gstars") >= 200 {
                        f.addImageToView(img: "6x6off", xpos: 411+backX, ypos: 602, w: 156, h: 53)
                    }
                }
                if size == 5 {
                    f.addImageToView(img: "4x4off", xpos: 70+backX, ypos: 602, w: 156, h: 53)
                    if save.integer(forKey: "gstars") >= 60 {
                        f.addImageToView(img: "5x5on", xpos: 240+backX, ypos: 602, w: 156, h: 53)
                    }
                    if save.integer(forKey: "gstars") >= 200 {
                        f.addImageToView(img: "6x6off", xpos: 411+backX, ypos: 602, w: 156, h: 53)
                    }
                }
                if size == 6 {
                    f.addImageToView(img: "4x4off", xpos: 70+backX, ypos: 602, w: 156, h: 53)
                    if save.integer(forKey: "gstars") >= 60 {
                        f.addImageToView(img: "5x5off", xpos: 240+backX, ypos: 602, w: 156, h: 53)
                    }
                    if save.integer(forKey: "gstars") >= 200 {
                        f.addImageToView(img: "6x6on", xpos: 411+backX, ypos: 602, w: 156, h: 53)
                    }
                }
                f.addImageToView(img: langs.gLangs[LSLanguage.lang][0], xpos: 70+backX, ypos: 730, w: 497, h: 101)
                if save.integer(forKey: "gstars") < 200 {
                    f.addImageToView(img: "6x6l", xpos: 411+backX, ypos: 603, w: 156, h: 84)
                }
                if save.integer(forKey: "gstars") < 60 {
                    f.addImageToView(img: "5x5l", xpos: 240+backX, ypos: 603, w: 156, h: 84)
                }
                if LSLanguage.lang == 0 {
                    f.addImageToViewWithAlpha(img: "engentitles", xpos: 0+backX, ypos: 0, w: 640, h: 1136, alpha: 1)
                } else {
                    f.addImageToViewWithAlpha(img: "rugentitles", xpos: 0+backX, ypos: 0, w: 640, h: 1136, alpha: 1)
                }
            }
        }
        //tops
        mf.addImageToViewWithAlpha(img: "top1.png", xpos: 0+backX, ypos: 0, w: 640, h: 229, alpha: 0.9)
        
        //view title and button
        if packState == 0 {
            mf.addImageToView(img: title, xpos: tX+backX, ypos: tY, w: tW, h: tH)
        } else if packState == 2 {
            mf.addImageToView(img: langs.mLangs[LSLanguage.lang][2], xpos: tX+backX, ypos: tY, w: tW, h: tH)
        } else if packState == 3 {
            if LSLanguage.lang == 0 {
                mf.addImageToView(img: "dctitle.png", xpos: tX+backX, ypos: tY, w: tW, h: tH)
            }
            if LSLanguage.lang == 1 {
                mf.addImageToView(img: "dctitle_ru.png", xpos: tX+backX, ypos: tY, w: tW, h: tH)
            }
        } else {
            if LSLanguage.lang == 0 {
                mf.addImageToView(img: "sgen.png", xpos: tX+backX, ypos: tY, w: tW, h: tH)
            }
            if LSLanguage.lang == 1 {
                mf.addImageToView(img: "sgen_ru.png", xpos: tX+backX, ypos: tY, w: tW, h: tH)
            }
        }
        mf.addImageToView(img: "back.png", xpos: backButtonX+backX, ypos: backButtonY, w: backButtonW, h: backButtonH)
        //tabs
        if packState == 0 || packState == 2 {
            //f.addImageToViewWithAlpha(img: "bList1", xpos: 109, ypos: 148, w: 152, h: 53, alpha: 1)
            //f.addImageToViewWithAlpha(img: "bGen0", xpos: 286, ypos: 148, w: 245, h: 53, alpha: 1)
            mf.addTextToView(x: 200+backX, y: 168, width: 149, height: 49, align: .left, font: "Lato-Light", size: 40, color: .black, text: String(save.integer(forKey: "energy")))
            mf.addImageToViewWithAlpha(img: "starsbar.png", xpos: 188+backX, ypos: 134, w: 379, h: 67, alpha: 1)
            mf.addTextToView(x: 150+backX, y: 166, width: 800, height: 214, align: .right, font: "Lato-Light", size: 44, color: .black, text: "\(save.integer(forKey: "stars"))/\(180)")
            mf.addImageToViewWithAlpha(img: "energybar.png", xpos: 70+backX, ypos: 134, w: 96, h: 67, alpha: 1)
            
        }
        if packState == 1 {
            //f.addImageToViewWithAlpha(img: "bList0", xpos: 109, ypos: 148, w: 152, h: 53, alpha: 1)
            //f.addImageToViewWithAlpha(img: "bGen1", xpos: 286, ypos: 148, w: 245, h: 53, alpha: 1)
            mf.addTextToView(x: 200+backX, y: 168, width: 149, height: 49, align: .left, font: "Lato-Light", size: 44, color: .black, text: String(save.integer(forKey: "energy")))
            mf.addImageToViewWithAlpha(img: "energybar.png", xpos: 70+backX, ypos: 134, w: 96, h: 67, alpha: 1)
            mf.addImageToViewWithAlpha(img: "genstarsbar.png", xpos: 188+backX, ypos: 134, w: 379, h: 67, alpha: 1)
            mf.addTextToView(x: 130+backX, y: 166, width: 800, height: 214, align: .right, font: "Lato-Light", size: 40, color: .black, text: "\(save.integer(forKey: "gstars"))")
            
        }
        if packState == 2 {
            f.addImageToView(img: langs.mLangs[LSLanguage.lang][5], xpos: 154+backX, ypos: 303, w: 329, h: 36)
            f.addImageToView(img: langs.mLangs[LSLanguage.lang][3], xpos: 70+backX, ypos: 385, w: 497, h: 135)
            f.addImageToView(img: langs.mLangs[LSLanguage.lang][4], xpos: 70+backX, ypos: 537, w: 497, h: 135)
        }
        if packState == 3 {
            mf.addImageToViewWithAlpha(img: "moneyscounter.png", xpos: 70+backX, ypos: 134, w: 497, h: 67, alpha: 1)
            mf.addTextToView(x: -38+backX, y: 166, width: 800, height: 214, align: .right, font: "Lato-Light", size: 40, color: .black, text: "\(save.integer(forKey: "dmoney"))")
            mf.addTextToView(x: 150+backX, y: 166, width: 800, height: 214, align: .right, font: "Lato-Light", size: 40, color: .black, text: "\(save.integer(forKey: "dgems"))")
            if save.integer(forKey: "dcDayCount") == 0 {
                if LSLanguage.lang == 0 {
                    f.addImageToView(img: "dday1.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                if LSLanguage.lang == 1 {
                    f.addImageToView(img: "dday1_ru.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                
            }
            if save.integer(forKey: "dcDayCount") == 1 {
                if LSLanguage.lang == 0 {
                    f.addImageToView(img: "dday2.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                if LSLanguage.lang == 1 {
                    f.addImageToView(img: "dday2_ru.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                
            }
            if save.integer(forKey: "dcDayCount") == 3 {
                if LSLanguage.lang == 0 {
                    f.addImageToView(img: "dday3.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                if LSLanguage.lang == 1 {
                    f.addImageToView(img: "dday3_ru.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                
            }
            if save.integer(forKey: "dcDayCount") == 4 {
                if LSLanguage.lang == 0 {
                    f.addImageToView(img: "dday4.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                if LSLanguage.lang == 1 {
                    f.addImageToView(img: "dday4_ru.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                
            }
            if save.integer(forKey: "dcDayCount") == 5 {
                if LSLanguage.lang == 0 {
                    f.addImageToView(img: "dday5.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                if LSLanguage.lang == 1 {
                    f.addImageToView(img: "dday5_ru.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                
            }
            if save.integer(forKey: "dcDayCount") == 6 {
                if LSLanguage.lang == 0 {
                    f.addImageToView(img: "dday6.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                if LSLanguage.lang == 1 {
                    f.addImageToView(img: "dday6_ru.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                
            }
            if save.integer(forKey: "dcDayCount") == 7 {
                if LSLanguage.lang == 0 {
                    f.addImageToView(img: "dday7.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                if LSLanguage.lang == 1 {
                    f.addImageToView(img: "dday7_ru.png", xpos: 0+backX, ypos: 248, w: 640, h: 430)
                }
                
            }
            if save.integer(forKey: "dcDayCount") > 6 {
                save.set(0, forKey: "dcDayCount")
            }
            if LSLanguage.lang == 0 {
                f.addImageToView(img: "dcstart.png", xpos: 70+backX, ypos: 708, w: 497, h: 110)
            } else {
                f.addImageToView(img: "dcstart_ru.png", xpos: 70+backX, ypos: 708, w: 497, h: 110)
            }
        }
        hf.addImageToViewWithAlpha(img: "darkbg.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(backBA))
        if backStarted {
            backX += (backXT - backX)/10
            backBA += 0.1
            v.lvl.viewYTarget = 1300
            if backTic > 15 {
                backStarted = false
                backX = 0
                backTic = 0
                v.startMenu.plAnim = 2
                v.startMenu.slogoy = -1141
                v.startMenu.slAlpha = 0
                v.startMenu.menuState = 1
                v.lvl.viewY = 4500
                v.gameState = 0
                b.tic = 0
            } else {
                backTic += 1
            }
        }
    }
    
    func compareTouch(point p: HEPoint, level l: LSLevel, v: ViewController) {
        if packState == 3 {
            if v.lvl.lvlTurn && !backStarted {
                if p.x > backButtonX && p.x < backButtonX + backButtonW && p.y > backButtonY && p.y < backButtonY + backButtonH {
                    v.touchPoint.x = 0
                    startBack(point: v.touchPoint, view: v)
                }
                if p.x > 70 && p.x < 70 + 497 && p.y > 708 && p.y < 708 + 110 {
                    let generator = LSLevelGenerator()
                    if save.integer(forKey: "dcDayCount") == 0 {
                        v.lvl = LSLevel(size: 3)
                        v.lvl.uID = "dclvl"
                        generator.c = 2
                        v.lvl.mix_count = 3
                        v.lvl.start_mix()
                        v.lvl.steps = 24
                        v.lvl.colors = generator.generate4x4()
                        v.lvl.winColors = v.lvl.colors
                        v.lvl.viewY = 890
                        v.lvl.lvlTurn = false
                        v.ticTop = 5
                        v.lvl.steps = 29
                    }
                    if save.integer(forKey: "dcDayCount") == 1 {
                        v.lvl = LSLevel(size: 4)
                        v.lvl.uID = "dclvl"
                        generator.c = 2
                        v.lvl.mix_count = 5
                        v.lvl.start_mix()
                        v.lvl.steps = 24
                        v.lvl.colors = generator.generate4x4()
                        v.lvl.winColors = v.lvl.colors
                        v.lvl.viewY = 890
                        v.lvl.lvlTurn = false
                        v.ticTop = 5
                        v.lvl.steps = 36
                    }
                    if save.integer(forKey: "dcDayCount") == 2 {
                        v.lvl = LSLevel(size: 4)
                        v.lvl.uID = "dclvl"
                        generator.c = 3
                        v.lvl.mix_count = 6
                        v.lvl.start_mix()
                        v.lvl.sec = 180
                        v.lvl.timeMode = true
                        v.lvl.colors = generator.generate4x4()
                        v.lvl.winColors = v.lvl.colors
                        v.lvl.viewY = 890
                        v.lvl.lvlTurn = false
                        v.ticTop = 5
                        v.lvl.steps = 0
                    }
                    if save.integer(forKey: "dcDayCount") == 3 {
                        v.lvl = LSLevel(size: 4)
                        v.lvl.uID = "dclvl"
                        generator.c = 3
                        v.lvl.mix_count = 6
                        v.lvl.start_mix()
                        v.lvl.sec = 180
                        v.lvl.timeMode = true
                        v.lvl.colors = generator.generate4x4()
                        v.lvl.winColors = v.lvl.colors
                        v.lvl.viewY = 890
                        v.lvl.lvlTurn = false
                        v.ticTop = 5
                        v.lvl.steps = 0
                    }
                    if save.integer(forKey: "dcDayCount") == 4 {
                        v.lvl = LSLevel(size: 5)
                        v.lvl.uID = "dclvl"
                        generator.c = 4
                        v.lvl.mix_count = 6
                        v.lvl.start_mix()
                        v.lvl.sec = 180
                        v.lvl.timeMode = true
                        v.lvl.colors = generator.generate5x5()
                        v.lvl.winColors = v.lvl.colors
                        v.lvl.viewY = 890
                        v.lvl.lvlTurn = false
                        v.ticTop = 5
                        v.lvl.steps = 0
                    }
                    if save.integer(forKey: "dcDayCount") == 5 {
                        v.lvl = LSLevel(size: 5)
                        v.lvl.uID = "dclvl"
                        generator.c = 5
                        v.lvl.mix_count = 6
                        v.lvl.start_mix()
                        v.lvl.sec = 180
                        v.lvl.timeMode = true
                        v.lvl.colors = generator.generate5x5()
                        v.lvl.winColors = v.lvl.colors
                        v.lvl.viewY = 890
                        v.lvl.lvlTurn = false
                        v.ticTop = 5
                        v.lvl.steps = 0
                    }
                    if save.integer(forKey: "dcDayCount") == 6 {
                        v.lvl = LSLevel(size: 6)
                        v.lvl.uID = "dclvl"
                        generator.c = 4
                        v.lvl.mix_count = 6
                        v.lvl.start_mix()
                        v.lvl.sec = 180
                        v.lvl.timeMode = true
                        v.lvl.colors = generator.generate6x6()
                        v.lvl.winColors = v.lvl.colors
                        v.lvl.viewY = 890
                        v.lvl.lvlTurn = false
                        v.ticTop = 5
                        v.lvl.steps = 0
                    }
                }
            }
        }
        if packState == 2 {
            if p.x > backButtonX && p.x < backButtonX + backButtonW && p.y > backButtonY && p.y < backButtonY + backButtonH {
                v.touchPoint.x = 0
                startBack(point: v.touchPoint, view: v)
            }
            //f.addImageToView(img: "cnmb.png", xpos: 70, ypos: 385, w: 497, h: 135)
            
            if p.x > 70 && p.x < 70 + 497 && p.y > 385 && p.y < 385 + 135 {
                v.currentPack = LSLevelPacks().pack1
                v.bgAnim.alpha = 2
            }
            if p.x > 70 && p.x < 70 + 497 && p.y > 537 && p.y < 537 + 135 {
                v.currentPack = LSLevelPacks().pack2
                v.bgAnim.alpha = 2
            }
        }
        if packState == 0 {
            if l.lvlTurn {
                if p.x > backButtonX && p.x < backButtonX + backButtonW && p.y > backButtonY && p.y < backButtonY + backButtonH {
                    //                    v.startMenu.plAnim = 2
                    //                    v.startMenu.slogoy = -1141
                    //                    v.startMenu.slAlpha = 0
                    //                    v.startMenu.menuState = 1
                    //                    l.viewY = 4500
                    //                    goBack = true
                    v.touchPoint.x = 0
                    startBack(point: v.touchPoint, view: v)
                }
                if p.x > 286 && p.x < 286 + 256 && p.y > 148 && p.y < 148 + 53 {
                    //packState = 1
                } else if p.x > 109 && p.x < 109 + 152 && p.y > 148 && p.y < 148 + 53 {
                    //packState = 0
                } else {
                    for i in pages {
                        if packState == 0 {
                            i.compareTouch(point: p, level: l, v: v)
                        }
                    }
                }
            }
        } else if packState == 1 {
            if l.lvlTurn {
                if save.string(forKey: "genlvl"+"savedBG") != nil {
                    //                    f.addImageToView(img: "genrecreate.png", xpos: 70+backX, ypos: 518, w: 497, h: 124)
                    if p.x > 70 && p.x < 70+497 && p.y > 374 && p.y < 374+125 {
                        v.lvl = LSLevel(size: save.integer(forKey: "genlvl"+"savedSize"))
                        v.lvl.uID = "genlvl"
                        v.lvl.load()
                        v.relvl = LSLevel(size: save.integer(forKey: "re"+"genlvl"+"savedSize"))
                        v.relvl.bg = save.string(forKey: "re"+"genlvl"+"savedBG")!
                        v.relvl.colors = save.array(forKey: "re"+"genlvl"+"savedColors") as! [[Int]]
                        v.relvl.winColors = save.array(forKey: "re"+"genlvl"+"savedWinColors") as! [[Int]]
                        v.relvl.complete = save.bool(forKey: "re"+"genlvl"+"savedComplete")
                        v.relvl.sec = save.integer(forKey: "re"+"genlvl"+"savedSec")
                        v.relvl.timeMode = save.bool(forKey: "re"+"genlvl"+"savedTimeMode")
                        v.relvl.scale = save.double(forKey: "re"+"genlvl"+"savedScale")
                        v.relvl.lvlIcon = save.string(forKey: "re"+"genlvl"+"savedLvlIcon")!
                        v.relvl.lvlID = save.integer(forKey: "re"+"genlvl"+"savedLvlID")
                        v.relvl.uID = save.string(forKey: "re"+"genlvl"+"savedUID")!
                        v.relvl.starcounter_value = save.double(forKey: "re"+"genlvl"+"savedStarcounter_value")
                        v.relvl.starcounter_speed = save.double(forKey: "re"+"genlvl"+"savedStarcounter_speed")
                        v.relvl.helpState = save.integer(forKey: "re"+"genlvl"+"savedHelpState")
                        v.relvl.steps = save.integer(forKey: "re"+"genlvl"+"savedSteps")
                        v.lvl.viewY = 1025
                    }
                    if p.x > 70 && p.x < 70+497 && p.y > 518 && p.y < 518+125 {
                        save.set(nil, forKey: "genlvl"+"savedBG")
                    }
                    if p.x > backButtonX && p.x < backButtonX + backButtonW && p.y > backButtonY && p.y < backButtonY + backButtonH {
                        //                    v.startMenu.plAnim = 2
                        //                    v.startMenu.slogoy = -1141
                        //                    v.startMenu.slAlpha = 0
                        //                    v.startMenu.menuState = 1
                        //                    l.viewY = 4500
                        //                    goBack = true
                        v.touchPoint.x = 0
                        startBack(point: v.touchPoint, view: v)
                    }
                } else {
                    if p.x > backButtonX && p.x < backButtonX + backButtonW && p.y > backButtonY && p.y < backButtonY + backButtonH {
                        //                    v.startMenu.plAnim = 2
                        //                    v.startMenu.slogoy = -1141
                        //                    v.startMenu.slAlpha = 0
                        //                    v.startMenu.menuState = 1
                        //                    l.viewY = 4500
                        //                    goBack = true
                        v.touchPoint.x = 0
                        startBack(point: v.touchPoint, view: v)
                    }
                    //f.addImageToView(img: "gencreate.png", xpos: 70, ypos: 730, w: 497, h: 101)
                    if p.x > 70 && p.x < 70 + 497 && p.y > 730 && p.y < 730 + 101 {
                        if save.integer(forKey: "energy") > 0 {
                            if size == 4 {
                                let generator = LSLevelGenerator()
                                v.lvl = LSLevel(size: 4)
                                v.lvl.uID = "genlvl"
                                
                                if difficulty == 0 {
                                    generator.c = 3
                                    v.lvl.mix_count = 3
                                    if StepSwitch.check {
                                        v.lvl.timeMode = false
                                        v.lvl.steps = 60
                                        v.lvl.starcounter_speed = 8
                                    } else if TimeSwitch.check {
                                        v.lvl.timeMode = true
                                        v.lvl.sec = 300
                                        v.lvl.steps = 0
                                    } else {
                                        v.lvl.timeMode = false
                                        v.lvl.steps = 1
                                    }
                                }
                                if difficulty == 1 {
                                    generator.c = 5
                                    v.lvl.mix_count = 5
                                    if StepSwitch.check {
                                        v.lvl.timeMode = false
                                        v.lvl.steps = 36
                                        v.lvl.starcounter_speed = 15.2
                                    } else if TimeSwitch.check {
                                        v.lvl.timeMode = true
                                        v.lvl.sec = 180
                                        v.lvl.steps = 0
                                    } else {
                                        v.lvl.timeMode = false
                                        v.lvl.steps = 1
                                    }
                                }
                                if difficulty == 2 {
                                    generator.c = 8
                                    v.lvl.mix_count = 8
                                    if StepSwitch.check {
                                        v.lvl.timeMode = false
                                        v.lvl.steps = 27
                                    } else if TimeSwitch.check {
                                        v.lvl.timeMode = true
                                        v.lvl.sec = 60
                                        v.lvl.steps = 0
                                    } else {
                                        v.lvl.timeMode = false
                                        v.lvl.steps = 1
                                    }
                                }
                                
                                v.lvl.start_mix()
                                v.lvl.colors = generator.generate4x4()
                                v.lvl.winColors = v.lvl.colors
                                v.lvl.viewY = 890
                                v.lvl.lvlTurn = false
                                v.ticTop = 5
                                if TimeSwitch.check {
                                    v.lvl.steps = -100
                                }
                            }
                            if save.integer(forKey: "gstars") >= 60 {
                                if size == 5 {
                                    let generator = LSLevelGenerator()
                                    v.lvl = LSLevel(size: 5)
                                    v.lvl.uID = "genlvl"
                                    if difficulty == 0 {
                                        generator.c = 3
                                        v.lvl.mix_count = 4
                                        if StepSwitch.check {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 66
                                        } else if TimeSwitch.check {
                                            v.lvl.timeMode = true
                                            v.lvl.sec = 300
                                            v.lvl.steps = 0
                                        } else {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 1
                                        }
                                    }
                                    if difficulty == 1 {
                                        generator.c = 5
                                        v.lvl.mix_count = 8
                                        if StepSwitch.check {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 42
                                        } else if TimeSwitch.check {
                                            v.lvl.timeMode = true
                                            v.lvl.sec = 180
                                            v.lvl.steps = 0
                                        } else {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 1
                                        }
                                    }
                                    if difficulty == 2 {
                                        generator.c = 8
                                        v.lvl.mix_count = 10
                                        if StepSwitch.check {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 33
                                        } else if TimeSwitch.check {
                                            v.lvl.timeMode = true
                                            v.lvl.sec = 60
                                            v.lvl.steps = 0
                                        } else {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 1
                                        }
                                    }
                                    
                                    
                                    
                                    v.lvl.start_mix()
                                    v.lvl.colors = generator.generate5x5()
                                    v.lvl.winColors = v.lvl.colors
                                    v.lvl.viewY = 890
                                    v.lvl.lvlTurn = false
                                    v.ticTop = 5
                                }
                                if TimeSwitch.check {
                                    v.lvl.steps = -100
                                }
                            }
                            if save.integer(forKey: "gstars") >= 200 {
                                if size == 6 {
                                    let generator = LSLevelGenerator()
                                    v.lvl = LSLevel(size: 6)
                                    v.lvl.uID = "genlvl"
                                    if difficulty == 0 {
                                        generator.c = 3
                                        v.lvl.mix_count = 4
                                        if StepSwitch.check {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 66
                                        } else if TimeSwitch.check {
                                            v.lvl.timeMode = true
                                            v.lvl.sec = 300
                                            v.lvl.steps = 0
                                        } else {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 1
                                        }
                                    }
                                    if difficulty == 1 {
                                        generator.c = 5
                                        v.lvl.mix_count = 10
                                        if StepSwitch.check {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 51
                                        } else if TimeSwitch.check {
                                            v.lvl.timeMode = true
                                            v.lvl.sec = 180
                                            v.lvl.steps = 0
                                        } else {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 1
                                        }
                                    }
                                    if difficulty == 2 {
                                        generator.c = 8
                                        v.lvl.mix_count = 8
                                        if StepSwitch.check {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 27
                                        } else if TimeSwitch.check {
                                            v.lvl.timeMode = true
                                            v.lvl.sec = 60
                                            v.lvl.steps = 0
                                        } else {
                                            v.lvl.timeMode = false
                                            v.lvl.steps = 1
                                        }
                                    }
                                    v.lvl.start_mix()
                                    v.lvl.colors = generator.generate6x6()
                                    v.lvl.winColors = v.lvl.colors
                                    v.lvl.viewY = 890
                                    v.lvl.lvlTurn = false
                                    v.ticTop = 5
                                    if TimeSwitch.check {
                                        v.lvl.steps = -100
                                    }
                                }
                            }
                        } else {
                            v.energyBanner.viewPanel()
                        }
                    }
                    if p.x > 70 && p.x < 70 + 288 && p.y > 292 && p.y < 292 + 53 {
                        difficulty = 0
                    }
                    if p.x > 240 && p.x < 240 + 288 && p.y > 292 && p.y < 292 + 53 {
                        difficulty = 1
                    }
                    if p.x > 411 && p.x < 411 + 288 && p.y > 292 && p.y < 292 + 53 {
                        difficulty = 2
                    }
                    //                    f.addImageToView(img: "stepoff", xpos: 70, ypos: 448, w: 243, h: 53)
                    //                    f.addImageToView(img: "timeon", xpos: 324, ypos: 448, w: 243, h: 53)
                    if p.x > 70 && p.x < 70 + 243 && p.y > 448 && p.y < 448 + 54 {
                        mode = 0
                        StepSwitch.check = true
                        TimeSwitch.check = false
                    }
                    if p.x > 324 && p.x < 324 + 243 && p.y > 448 && p.y < 448 + 54 {
                        mode = 1
                        StepSwitch.check = false
                        TimeSwitch.check = true
                    }
                    if p.x > 70 && p.x < 70 + 156 && p.y > 602 && p.y < 602 + 53 {
                        size = 4
                    }
                    if p.x > 240 && p.x < 602 + 156 && p.y > 602 && p.y < 602 + 53 {
                        if save.integer(forKey: "gstars") >= 60 {
                            size = 5
                        }
                    }
                    if p.x > 411 && p.x < 411 + 156 && p.y > 602 && p.y < 602 + 53 {
                        if save.integer(forKey: "gstars") >= 200 {
                            size = 6
                        }
                    }
                    //StepSwitch.compareTouch(point: p)
                    if StepSwitch.check {
                        TimeSwitch.check = false
                    }
                    //TimeSwitch.compareTouch(point: p)
                    if TimeSwitch.check {
                        StepSwitch.check = false
                    }
                    
                }
            }
        }
    }
    
    func updateBack(view v: ViewController, bg b: LSBackgroundAnimation) {
        if goBack {
            goBack = false
            v.gameState = 0
            b.alpha = 1
            b.tic = 0
        }
    }
    
    func startScroll(starttouch st: Double) {
        endSpeed = 0
        startPos = movY
        startTouch = st
        pEndSpeed = 0
    }
    
    func endScroll(endTouch: Double) {
        if scrolTic > 1 {
            endSpeed = pEndSpeed
        }
        scrolTic = 0
    }
    
    func scroll(currenttouch ct: Double) {
        if scrolTic > 1 {
            movY = startPos - (startTouch - ct)
            pEndSpeed = (currentTouch - ct) * -1.5
        }
        currentTouch = ct
        scrolTic += 1
    }
    
    func nextPage() {
        if currentPage < pages.count-1 {
            currentPage += 1
        }
    }
    func previousPage() {
        if currentPage > 0 {
            currentPage -= 1
        }
    }
    
    func startBack(point p: HEPoint, view v: ViewController) {
        if v.lvl.lvlTurn {
            if p.x < 25 {
                backStarted = true
            }
        }
    }
}

