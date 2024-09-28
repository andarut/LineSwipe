//
//  LSStartScreen.swift
//  LineSwipe
//
//  Created by Daniil Belov on 22.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSStartScreen {
    
    var langs = LSLanguage()
    var alpha = CGFloat(1.0)
    
    var slogo_currentframe = 0.0
    var slogo_maxframe = 35.0
    
    var plImage = "play.png"
    var plX = 225.0
    var plY = 855.0
    var plW = 182.0
    var plH = 182.0
    
    var smImage = "selectmodebtn.png"
    var smX = 98.0
    var smY = 891.0
    var smH = 109.0
    var smW = 109.0
    
    var sImage = "settings.png"
    var sX = 425.0
    var sY = 891.0
    var sW = 109.0
    var sH = 109.0
    
    var slAlpha = CGFloat(1.0)
    var slTic = 0
    
    var slPos = 1.0
    
    var plScale = 0.0
    var plAnim = 0
    
    var start = false
    
    var menuState = 0
    
    var mYTarget = 0.0
    var mY = 400.0
    
    var mAlpha = 0.0
    var mATarget = 1.0
    
    var bgAlpha = 1.0
    
    var selectModeAnim = false
    
    var testSwitch = LSSettingsSwitch()
    
    
    
    var soundSwitch = LSSettingsSwitch()
    var markersSwitch = LSSettingsSwitch()
    var animationSwitch = LSSettingsSwitch()
    var enLangBtn = LSSelectButton()
    var ruLangBtn = LSSelectButton()
    var ykLangBtn = LSSelectButton()
    var ourteam = LSSelectButton()
    
    var startPage = 1
    
    var dA = -2.0
    
    var LSLogoAnimationFrame = -15.0
    var LSLogoAnimationMaxFrame = 40.0
    
    //menu btns
    var bse = LSMenuButton(type: 0)
    var bst = LSMenuButton(type: 1)
    var bsh = LSMenuButton(type: 2)
    
    var btns = [LSMenuButton]()
    
    var helpPages = [LSPage(picture: "fh01en.png"), LSPage(picture: "02en.png"), LSPage(picture: "03en.png"), LSPage(picture: "04en.png"), LSPage(picture: "05en.png"), LSPage(picture: "06en.png")]
    var currentHelpPage = 0
    
    var slogoy = 0.0
    var slogos = 1.0
    
    var tap6 = 0
    
    var tutorial = LSTutorial()
    
    let shopPage = LSShopPage()
    
    init() {
        let save = UserDefaults.standard
        soundSwitch.check = save.bool(forKey: "settings.sound")
        markersSwitch.check = save.bool(forKey: "settings.color")
        animationSwitch.check = save.bool(forKey: "settings.taptic")
        if !save.bool(forKey: "nofirst5") {
            //menuState = 5
            soundSwitch.check = true
            markersSwitch.check = false
            animationSwitch.check = true
            save.set(soundSwitch.check, forKey: "settings.sound")
            save.set(markersSwitch.check, forKey: "settings.color")
            save.set(markersSwitch.check, forKey: "settings.taptic")
            save.set(true, forKey: "settings.animation")
            save.set(true, forKey: "nofirst5")
            save.set(8, forKey: "energy")
        }
        
        bse.x = 116
        bse.y = 920
        
        bst.x = 269
        bst.y = 920
        
        bsh.x = 422
        bsh.y = 920
        btns = [bse, bst, bsh]
    }
    
    func updateScreen(frame f: HEGameFrame, v: ViewController, mf: HEGameFrame) {
        if menuState == 15 {
            shopPage.updateView(frame: f, mf: v.hightGameView, v: v)
        }
        f.addImageToViewWithAlpha(img: "darkbg.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(bgAlpha))
        if menuState == 10 {
            f.addImageToViewWithAlpha(img: langs.langs[LSLanguage.lang][7], xpos: 0, ypos: 0, w: 640, h: 1136, alpha: 1)
        }
        if menuState == 7 {
            //            for i in 0...helpPages.count-1 {
            //                helpPages[i].targetX = Double((i - currentHelpPage)*640)
            //            }
            //            f.addImageToViewWithAlpha(img: "lstart.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(bgAlpha))
            //            for i in helpPages {
            //                i.updateView(frame: f)
            //            }
            //            if currentHelpPage < 0 {
            //                currentHelpPage = 0
            //            }
            tutorial.updateView(frame: f, v: v)
        }
        if menuState == 6 {
            if LSLogoAnimationFrame >= 0 {
                f.addImageToViewWithAlpha(img: "lsla\(Int(LSLogoAnimationFrame)).jpg", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: 1)
            }
            if !selectModeAnim {
                if LSLogoAnimationFrame < LSLogoAnimationMaxFrame {
                    LSLogoAnimationFrame += 0.5
                }
            }
            if selectModeAnim {
                LSLogoAnimationFrame -= 0.5
            }
            if LSLogoAnimationFrame >= 1 {
                f.addImageToView(img: "bgtoplsla.png", xpos: 0, ypos: 0, w: 640, h: 1136)
            }
        }
        if menuState == 0 {
            if plAnim == 2 {
                //logo
                f.addImageToViewWithAlpha(img: "logo1.png", xpos: 75, ypos: 191*slPos, w: 483, h: 483, alpha: CGFloat(alpha))
                
                //button
                f.addImageToViewWithAlpha(img: plImage, xpos: plX, ypos: plY, w: plW, h: plH, alpha: CGFloat(alpha))
                
                f.addImageToViewWithAlpha(img: smImage, xpos: smX, ypos: smY, w: smW, h: smH, alpha: CGFloat(alpha))
                f.addImageToViewWithAlpha(img: sImage, xpos: sX, ypos: sY, w: sW, h: sH, alpha: CGFloat(alpha))
            } else {
                //logo
                f.addImageToViewWithAlpha(img: "mainmenu.png", xpos: 0, ypos: 0*slPos, w: 640, h: 1136, alpha: CGFloat(bgAlpha))
                
                //button
                f.addImageToViewWithAlpha(img: plImage, xpos: plX, ypos: plY, w: plW, h: plH, alpha: CGFloat(bgAlpha))
                
                f.addImageToViewWithAlpha(img: smImage, xpos: smX, ypos: smY, w: smW, h: smH, alpha: CGFloat(bgAlpha))
                f.addImageToViewWithAlpha(img: sImage, xpos: sX, ypos: sY, w: sW, h: sH, alpha: CGFloat(bgAlpha))
            }
            //button anim1
            if plAnim != 2 {
                if plAnim == 0 {
                    plScale += 0.2
                    if plScale > 5 {
                        plAnim = 1
                    }
                } else {
                    plScale -= 0.2
                    if plScale < 0 {
                        plAnim = 0
                    }
                }
            } else {
                slPos -= 0.2
                plScale += 60
                alpha -= 0.05
                if alpha <= 0 {
                    menuState = 1
                }
            }
        } else if menuState == 1 {
            
            f.addImageToViewWithAlpha(img: langs.mLangs[LSLanguage.lang][0], xpos: 94-5, ypos: 450 + mY, w: 463, h: 115, alpha: CGFloat(mAlpha))
            f.addImageToViewWithAlpha(img: "mq.png", xpos: 510, ypos: 97 + mY, w: 49, h: 49, alpha: CGFloat(mAlpha))
            f.addImageToViewWithAlpha(img: langs.mLangs[LSLanguage.lang][1], xpos: 94-5, ypos: 585 + mY, w: 463, h: 115, alpha: CGFloat(mAlpha))
            if v.day != v.save.integer(forKey: "dcDay") || v.month != v.save.integer(forKey: "dcMonth") {
                f.addImageToViewWithAlpha(img: langs.mLangs[LSLanguage.lang][11], xpos: 94-5, ypos: 720 + mY, w: 463, h: 115, alpha: CGFloat(mAlpha))
            } else {
                f.addImageToViewWithAlpha(img: langs.mLangs[LSLanguage.lang][12], xpos: 94-5, ypos: 720 + mY, w: 463, h: 115, alpha: CGFloat(mAlpha))
            }
            f.addImageToViewWithAlpha(img: "swipelines.png", xpos: 0, ypos: 0 + mY, w: 640, h: 1136, alpha: CGFloat(mAlpha))
            for i in btns {
                i.updateView(frame: f, moveX: -7, moveY: mY, alpha: mAlpha)
            }
            //continue button
            //let save = UserDefaults.standard
            /*if save.integer(forKey: "savedSize") > 1 {
             f.addImageToViewWithAlpha(img: "maincontinue.png", xpos: 195, ypos: 731 + mY, w: 281, h: 40, alpha: CGFloat(mAlpha))
             if save.bool(forKey: "savedTimeMode") {
             f.addImageToViewWithAlpha(img: "tmcontinue.png", xpos: 94, ypos: 789 + mY, w: 463, h: 147, alpha: CGFloat(mAlpha))
             } else {
             f.addImageToViewWithAlpha(img: "nmcontinue.png", xpos: 94, ypos: 789 + mY, w: 463, h: 147, alpha: CGFloat(mAlpha))
             }
             f.addTextToView(x: 540, y: 840 + mY, width: 800, height: 100, align: .left, font: "Lato-Black", size: 44, color: UIColor(red:0.09, green:0.09, blue:0.09, alpha:1.0), text: "LEVEL \(save.integer(forKey: "savedLvlID"))")
             }*/
            
            
            
            //start anim
            if mY > mYTarget {
                mY -= (mY - mYTarget) / 8
            }
            if mY < mYTarget {
                mY += (mYTarget - mY) / 8
            }
            
            if mAlpha < mATarget {
                mAlpha += 0.05
            }
            if mAlpha > mATarget {
                mAlpha -= 0.05
            }
            
            
        }
        if menuState == 20 {
            let save = UserDefaults.standard
            
            f.addImageToView(img: "fortesterspage.png", xpos: 0, ypos: 0, w: 640, h: 1136)
            f.addTextToView(x: 315, y: 456, width: 800, height: 214, align: .center, font: "Lato-Light", size: 30, color: .white, text: String(save.integer(forKey: "stars")))
            f.addTextToView(x: 315, y: 716, width: 800, height: 214, align: .center, font: "Lato-Light", size: 30, color: .white, text: String(save.integer(forKey: "gstars")))
        }
        
        //select mode anim
        if selectModeAnim {
            mYTarget = -100
            mATarget = 0
            if bgAlpha > 0 {
                if menuState == 6 {
                    bgAlpha -= 0.05
                } else {
                    bgAlpha -= 0.05
                }
            } else {
                start = true
                selectModeAnim = false
                bgAlpha = 1
                mYTarget = 0
                mYTarget = 1
                mATarget = 1
                menuState = 1
            }
        }
        //stars
        let save = UserDefaults.standard
        //f.addTextToView(x: 460, y: 900, width: 800, height: 100, align: .left, font: "Lato-Light", size: 26, color: .gray, text: "STARS: \(save.integer(forKey: "stars"))")
        //version
        //let dictionary = Bundle.main.infoDictionary!
        //let version = dictionary["CFBundleShortVersionString"] as! String
        //let build = dictionary["CFBundleVersion"] as! String
        //f.addTextToView(x: 460, y: 1100, width: 800, height: 100, align: .left, font: "Lato-Light", size: 26, color: .gray, text: "BETA: version \(version), build \(build) - Cutie Hearth Games")
        if (plAnim == 2 || selectModeAnim) && menuState != 7 {
            for i in f.labels {
                i.alpha = CGFloat(mAlpha)
            }
        }
        save.set(soundSwitch.check, forKey: "settings.sound")
        save.set(markersSwitch.check, forKey: "settings.color")
        save.set(animationSwitch.check, forKey: "settings.taptic")
        //testSwitch.updateView(frame: f)
        if menuState == 4 {
            //lang
            if LSLanguage.lang == 0 {
                enLangBtn.check = true
            } else {
                enLangBtn.check = false
            }
            if LSLanguage.lang == 1 {
                ruLangBtn.check = true
            } else {
                ruLangBtn.check = false
            }
            if LSLanguage.lang == 2 {
                ykLangBtn.check = true
            } else {
                ykLangBtn.check = false
            }
            
            soundSwitch.text = langs.sLangs[LSLanguage.lang][1]
            soundSwitch.y = 232
            soundSwitch.updateView(frame: f)
            markersSwitch.text = langs.sLangs[LSLanguage.lang][2]
            markersSwitch.y = 317
            markersSwitch.updateView(frame: f)
            if LSLanguage.lang == 0 {
                animationSwitch.text = "TAPTIC ENGINE"
            } else {
                animationSwitch.text = "ВИБРАЦИЯ"
            }
            animationSwitch.y = 402
            animationSwitch.updateView(frame: f)
            enLangBtn.text = "ENGLISH"
            enLangBtn.y = 581+160
            enLangBtn.updateView(frame: f)
            ruLangBtn.text = "РУССКИЙ"
            ruLangBtn.y = 660+160
            ruLangBtn.updateView(frame: f)
            //f.addImageToView(img: "fortesters.png", xpos: 82, ypos: 849, w: 480, h: 63)
            if enLangBtn.check == true {
                f.addImageToViewWithAlpha(img: "ourteam.png", xpos: 82, ypos: 940, w: 230, h: 105, alpha: CGFloat(mAlpha))
                f.addImageToViewWithAlpha(img: "community.png", xpos: 342, ypos: 940, w: 230, h: 105, alpha: CGFloat(mAlpha))
                f.addImageToViewWithAlpha(img: "back.png", xpos: 92, ypos: 108, w: 62, h: 62, alpha: CGFloat(mAlpha))
                f.addImageToViewWithAlpha(img: "tsettings.png", xpos: 310, ypos: 119, w: 248, h: 40, alpha: CGFloat(mAlpha))
                
            }
            if ruLangBtn.check == true {
                f.addImageToViewWithAlpha(img: "ourteam_ru.png", xpos: 82, ypos: 940, w: 230, h: 105, alpha: CGFloat(mAlpha))
                f.addImageToViewWithAlpha(img: "community_ru.png", xpos: 342, ypos: 940, w: 230, h: 105, alpha: CGFloat(mAlpha))
                f.addImageToViewWithAlpha(img: "back.png", xpos: 92, ypos: 108, w: 62, h: 62, alpha: CGFloat(mAlpha))
                f.addImageToViewWithAlpha(img: "tsettings_ru.png", xpos: 310, ypos: 119, w: 248, h: 40, alpha: CGFloat(mAlpha))
                
            }
            if ykLangBtn.check == true {
                f.addImageToViewWithAlpha(img: "ourteam_ru.png", xpos: 82, ypos: 940, w: 230, h: 105, alpha: CGFloat(mAlpha))
                f.addImageToViewWithAlpha(img: "community_yk.png", xpos: 342, ypos: 940, w: 230, h: 105, alpha: CGFloat(mAlpha))
                f.addImageToViewWithAlpha(img: "back.png", xpos: 92, ypos: 108, w: 62, h: 62, alpha: CGFloat(mAlpha))
                f.addImageToViewWithAlpha(img: "tsettings_yk.png", xpos: 310, ypos: 119, w: 248, h: 40, alpha: CGFloat(mAlpha))
            }
        }
        if menuState == 14 {
            if enLangBtn.check == true {
                f.addImageToViewWithAlpha(img: "ourteampage.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(mAlpha))
            }
            if ruLangBtn.check == true {
                f.addImageToViewWithAlpha(img: "ourteampage_ru.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(mAlpha))
            }
            if ykLangBtn.check == true {
                f.addImageToViewWithAlpha(img: "ourteampage_yk.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(mAlpha))
            }
        }
        if menuState == 5 {
            if slTic == 250 {
                f.addImageToViewWithAlpha(img: "start\(startPage).png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: 1);
            }
        }
        if menuState == 13 {
            f.addImageToViewWithAlpha(img: "helppage.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(mAlpha))
        }
        //start logo
        if slAlpha < 2 {
            f.addImageToViewWithAlpha(img: "slogo\(35).jpg", xpos: 0, ypos: slogoy, w: 640, h: 1136, alpha: 1)
            //animation
            if slogo_currentframe < slogo_maxframe {
                slogo_currentframe += 0.3
            }
            if slTic == 250 {
                slAlpha -= 0.1
                if slogoy > -1140 {
                    slogoy -= slogos
                    slogos += 3
                    menuState = 6
                }
            } else {
                slTic += 1
            }
        }
        //additional anim
        if dA > 0 {
            dA -= 0.05
        } else {
            dA = 0
        }
        mf.addImageToViewWithAlpha(img: "darkbg.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: CGFloat(dA))
    }
    
    func updateStart(view v: ViewController) {
        if start {
            start = false
            v.gameState = 1
        }
    }
    
    /*func startGame(view v: ViewController) {
     if menuState == 0 {
     if slTic == 250 {
     plAnim = 2
     }
     }
     }*/
    
    func selectMode(point p: HEPoint, view v: ViewController) {
        if menuState == 14 {
            if p.x > 154 && p.x < 154 + 344 && p.y > 847 && p.y < 847 + 125 {
                if let url = URL(string: "http://cutiehearth.com/contact"){
                    UIApplication.shared.open(url)
                }
            }
        }
        if menuState == 6 {
            if tap6 == 0 {
                LSSounds.enable = true
                bgAlpha = 6
                LSLogoAnimationFrame = 25
                let save = UserDefaults.standard
                if save.bool(forKey: "helpshowed2") {
                    if save.integer(forKey: "savedSize") > 1 {
                        v.lvl = LSLevel(size: save.integer(forKey: "savedSize"))
                        v.lvl.bg = save.string(forKey: "savedBG")!
                        v.lvl.colors = save.array(forKey: "savedColors") as! [[Int]]
                        v.lvl.winColors = save.array(forKey: "savedWinColors") as! [[Int]]
                        v.lvl.complete = save.bool(forKey: "savedComplete")
                        v.lvl.sec = save.integer(forKey: "savedSec")
                        v.lvl.timeMode = save.bool(forKey: "savedTimeMode")
                        v.lvl.scale = save.double(forKey: "savedScale")
                        v.lvl.lvlIcon = save.string(forKey: "savedLvlIcon")!
                        v.lvl.lvlID = save.integer(forKey: "savedLvlID")
                        v.lvl.uID = save.string(forKey: "savedUID")!
                        v.lvl.starcounter_value = save.double(forKey: "savedStarcounter_value")
                        v.lvl.starcounter_speed = save.double(forKey: "savedStarcounter_speed")
                        v.lvl.helpState = save.integer(forKey: "savedHelpState")
                        v.lvl.steps = save.integer(forKey: "savedSteps")
                        
                        //re lvl
                        v.relvl = LSLevel(size: save.integer(forKey: "re"+v.lvl.uID+"savedSize"))
                        v.relvl.size = save.integer(forKey: "re"+v.lvl.uID+"savedSize")
                        v.relvl.bg = save.string(forKey: "re"+v.lvl.uID+"savedBG")!
                        if save.array(forKey: "re"+v.lvl.uID+"savedStartColors") != nil {
                            v.relvl.colors = save.array(forKey: "re"+v.lvl.uID+"savedStartColors") as! [[Int]]
                            if save.array(forKey: "re"+v.lvl.uID+"savedStartSec") != nil {
                                v.relvl.sec = save.integer(forKey: "re"+v.lvl.uID+"savedStartSec")
                                v.relvl.steps = save.integer(forKey: "re"+v.lvl.uID+"savedStartSteps")
                            }
                        }
                        v.relvl.winColors = save.array(forKey: "re"+v.lvl.uID+"savedWinColors") as! [[Int]]
                        v.relvl.complete = false
                        v.relvl.timeMode = save.bool(forKey: "re"+v.lvl.uID+"savedTimeMode")
                        v.relvl.scale = save.double(forKey: "re"+v.lvl.uID+"savedScale")
                        v.relvl.lvlIcon = save.string(forKey: "re"+v.lvl.uID+"savedLvlIcon")!
                        v.relvl.lvlID = save.integer(forKey: "re"+v.lvl.uID+"savedLvlID")
                        v.relvl.uID = save.string(forKey: "re"+v.lvl.uID+"savedUID")!
                        v.relvl.starcounter_value = 492
                        v.relvl.starcounter_speed = save.double(forKey: "re"+v.lvl.uID+"savedStarcounter_speed")
                        v.relvl.helpState = save.integer(forKey: "re"+v.lvl.uID+"savedHelpState")
                        
                        //relvl load
                        if save.string(forKey: "re"+v.lvl.uID+"savedBG") != nil {
                            v.relvl.bg = save.string(forKey: "re"+v.lvl.uID+"savedBG")!
                            v.relvl.colors = save.array(forKey: "re"+v.lvl.uID+"savedColors") as! [[Int]]
                            v.relvl.winColors = save.array(forKey: "re"+v.lvl.uID+"savedWinColors") as! [[Int]]
                            v.relvl.complete = save.bool(forKey: "re"+v.lvl.uID+"savedComplete")
                            v.relvl.sec = save.integer(forKey: "re"+v.lvl.uID+"savedSec")
                            v.relvl.timeMode = save.bool(forKey: "re"+v.lvl.uID+"savedTimeMode")
                            v.relvl.scale = save.double(forKey: "re"+v.lvl.uID+"savedScale")
                            v.relvl.lvlIcon = save.string(forKey: "re"+v.lvl.uID+"savedLvlIcon")!
                            v.relvl.lvlID = save.integer(forKey: "re"+v.lvl.uID+"savedLvlID")
                            v.relvl.uID = save.string(forKey: "re"+v.lvl.uID+"savedUID")!
                            v.relvl.starcounter_value = save.double(forKey: "re"+v.lvl.uID+"savedStarcounter_value")
                            v.relvl.starcounter_speed = save.double(forKey: "re"+v.lvl.uID+"savedStarcounter_speed")
                            v.relvl.helpState = save.integer(forKey: "re"+v.lvl.uID+"savedHelpState")
                            v.relvl.steps = save.integer(forKey: "re"+v.lvl.uID+"savedSteps")
                        }
                        
                        if save.bool(forKey: "savedLvlTurn") {
                            v.lvl.lvlTurn = true
                            v.lvl.viewY = 1800
                        }
                        let timeMode = save.bool(forKey: "savedTimeMode")
                        let lvlpacks = LSLevelPacks()
                        if timeMode {
                            v.currentPack = lvlpacks.pack2
                        } else {
                            v.currentPack = lvlpacks.pack1
                        }
                        plAnim = 2
                        selectModeAnim = true
                    } else {
                        let lvlpacks = LSLevelPacks()
                        v.currentPack = lvlpacks.pack1
                        plAnim = 2
                        selectModeAnim = true
                    }
                    if save.integer(forKey: "savedGameState") == 0 {
                        //v.currentPack.eBack = true
                    }
                } else {
                    tutorial.stateStep = -1
                    menuState = 7
                }
                tap6 += 1
                v.currentPack.packState = save.integer(forKey: "savedPackState")
                if v.day != v.save.integer(forKey: "dcDay") {
                    v.currentPack.packState = 3
                    v.save.set(3, forKey: "savedPsckState")
                    v.lvl.lvlTurn = true
                    v.lvl.viewY = 1400
                }
            }
        }
        if menuState == 13 {
            if p.x > 55 && p.x < 55 + 51 && p.y > 92 && p.y < 92 + 51 {
                menuState = 1
            }
        }
        if menuState == 4 {
            let save = UserDefaults.standard
            soundSwitch.compareTouch(point: p)
            markersSwitch.compareTouch(point: p)
            animationSwitch.compareTouch(point: p)
            if p.x > 92 && p.x < 92 + 62 && p.y > 108 && p.y < 108 + 62 {
                menuState = 1
                selectModeAnim = false
                plAnim = 0
                plScale = 0
                alpha = 1
                slPos = 0
                mAlpha = 0
                slAlpha = 0
                mY = 200
                dA = 1
            }
            
            if enLangBtn.touch(point: p) {
                LSLanguage.lang = 0
                save.set(0, forKey: "settings.lang")
            }
            if ruLangBtn.touch(point: p) {
                LSLanguage.lang = 1
                save.set(1, forKey: "settings.lang")
            }
            
            if p.x > 82 && p.x < 82 + 480 && p.y > 849 && p.y < 849 + 63 {
                //menuState = 20
            }
            
            if p.x > 342 && p.x < 342 + 230 && p.y > 940 && p.y < 940 + 115  {
                var objectsToShare = ["Я играю в SwipeLines. Скачать для iOS можно по ссылке:", URL(string: "http://cutiehearth.com/en/swipelines/download")!] as [Any]
                if LSLanguage.lang == 0 {
                    objectsToShare = ["I playing SwipeLines. Download for iOS:", URL(string: "http://cutiehearth.com/en/swipelines/download")!] as [Any]
                }
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                //activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
                
                v.present(activityVC, animated: true, completion: nil)
            }
            if p.x > 82 && p.x < 82 + 230 && p.y > 940 && p.y < 940 + 115  {
                if let url = URL(string: "http://cutiehearth.com") {
                    UIApplication.shared.open(url, options: [:]) {
                        boolean in
                        // do something with the boolean
                    }
                }
            }
        }
        if menuState == 0 {
            if slTic == 250 {
                if p.x > smX && p.x < smX + smW && p.y > smY && p.y < smY + smH {
                    plAnim = 2
                }
                if p.x > sX && p.x < sX + sW && p.y > sY && p.y < sY + sH {
                    menuState = 4
                    dA = 1
                }
                //continue
                let save = UserDefaults.standard
                if save.integer(forKey: "savedSize") > 1 {
                    if p.x > plX && p.x < plX + plW && p.y > plY && p.y < plY + plH {
                        v.lvl = LSLevel(size: save.integer(forKey: "savedSize"))
                        v.lvl.bg = save.string(forKey: "savedBG")!
                        v.lvl.colors = save.array(forKey: "savedColors") as! [[Int]]
                        v.lvl.winColors = save.array(forKey: "savedWinColors") as! [[Int]]
                        v.lvl.complete = save.bool(forKey: "savedComplete")
                        v.lvl.sec = save.integer(forKey: "savedSec")
                        v.lvl.timeMode = save.bool(forKey: "savedTimeMode")
                        v.lvl.scale = save.double(forKey: "savedScale")
                        v.lvl.lvlIcon = save.string(forKey: "savedLvlIcon")!
                        v.lvl.lvlID = save.integer(forKey: "savedLvlID")
                        v.lvl.uID = save.string(forKey: "savedUID")!
                        v.lvl.starcounter_value = save.double(forKey: "savedStarcounter_value")
                        v.lvl.starcounter_speed = save.double(forKey: "savedStarcounter_speed")
                        v.lvl.helpState = save.integer(forKey: "savedHelpState")
                        v.lvl.steps = save.integer(forKey: "savedSteps")
                        let timeMode = save.bool(forKey: "savedTimeMode")
                        let lvlpacks = LSLevelPacks()
                        if timeMode {
                            v.currentPack = lvlpacks.pack2
                        } else {
                            v.currentPack = lvlpacks.pack1
                        }
                        plAnim = 2
                        selectModeAnim = true
                        mY = -100
                    }
                }
            }
        }
        if menuState == 5 {
            if slTic == 250 {
                if startPage == 4 {
                    selectModeAnim = true
                    let lvlpacks = LSLevelPacks()
                    v.currentPack = lvlpacks.pack1
                    v.lvl.lvlTurn = false
                    lvlpacks.pack1.pages[0].levelLoad(level: v.lvl, levelnum: 0, v: v)
                    v.lvl.lvlPlay = true
                    menuState = 0
                    let save = UserDefaults.standard
                    save.set(true, forKey: "nofirst1")
                } else {
                    startPage += 1
                }
            }
        }
        if menuState == 7 {
            tutorial.touch()
            bgAlpha = 1
        }
        if menuState == 1 {
            let save = UserDefaults.standard
            v.bgAnim.alpha = 1
            if p.x > 94 && p.x < 94 + 463 && p.y > 450 && p.y < 450 + 115 {
                let lvlpacks = LSLevelPacks()
                v.currentPack = lvlpacks.pack2
                selectModeAnim = true
                save.set(0, forKey: "savedPackState")
                v.currentPack.packState = 2
                save.set(save.integer(forKey: "mBtnClick")+1, forKey: "mBtnClick")
            }
            if p.x > 94 && p.x < 94 + 463 && p.y > 585 && p.y < 585 + 115 {
                let lvlpacks = LSLevelPacks()
                v.currentPack = lvlpacks.pack1
                v.currentPack.packState = 1
                selectModeAnim = true
                save.set(1, forKey: "savedPackState")
                save.set(save.integer(forKey: "mBtnClick")+1, forKey: "mBtnClick")
            }
            if p.x > 94 && p.x < 94 + 463 && p.y > 720 && p.y < 720 + 115 {
                if v.day != v.save.integer(forKey: "dcDay") || v.month != v.save.integer(forKey: "dcMonth") {
                    let lvlpacks = LSLevelPacks()
                    v.currentPack = lvlpacks.pack1
                    v.currentPack.packState = 3
                    selectModeAnim = true
                    save.set(0, forKey: "savedPackState")
                    save.set(save.integer(forKey: "mBtnClick")+1, forKey: "mBtnClick")
                }
            }
            if p.x > 500 && p.x < 500 + 116 && p.y > 40 && p.y < 40 + 116 {
                tutorial = LSTutorial()
                dA = 1
                menuState = 7
                mY = 400
                mAlpha = 0
            }
            for i in btns {
                i.compareTouch(point: p, view: v)
            }
            //            if p.x > 92 && p.x < 92 + 62 && p.y > 108 && p.y < 108 + 62 {
            //                menuState = 0
            //                selectModeAnim = false
            //                plAnim = 0
            //                plScale = 0
            //                alpha = 1
            //                slPos = 0
            //                mAlpha = 0
            //                slAlpha = 0
            //                mY = 200
            //                dA = 1
            //            }
            //continue
            /*if p.x > 94 && p.x < 94 + 463 && p.y > 789 && p.y < 789 + 147 {
             let save = UserDefaults.standard
             if save.integer(forKey: "savedSize") > 1 {
             v.lvl = LSLevel(size: save.integer(forKey: "savedSize"))
             v.lvl.bg = save.string(forKey: "savedBG")!
             v.lvl.colors = save.array(forKey: "savedColors") as! [[Int]]
             v.lvl.winColors = save.array(forKey: "savedWinColors") as! [[Int]]
             v.lvl.complete = save.bool(forKey: "savedComplete")
             v.lvl.sec = save.integer(forKey: "savedSec")
             v.lvl.timeMode = save.bool(forKey: "savedTimeMode")
             v.lvl.scale = save.double(forKey: "savedScale")
             v.lvl.lvlIcon = save.string(forKey: "savedLvlIcon")!
             v.lvl.lvlID = save.integer(forKey: "savedLvlID")
             v.lvl.uID = save.string(forKey: "savedUID")!
             v.lvl.starcounter_value = save.double(forKey: "savedStarcounter_value")
             v.lvl.starcounter_speed = save.double(forKey: "savedStarcounter_speed")
             v.lvl.helpState = save.integer(forKey: "savedHelpState")
             let timeMode = save.bool(forKey: "savedTimeMode")
             let lvlpacks = LSLevelPacks()
             if timeMode {
             v.currentPack = lvlpacks.pack2
             } else {
             v.currentPack = lvlpacks.pack1
             }
             selectModeAnim = true
             }
             }*/
        } else if menuState == 15 {
            shopPage.compareTouch(p: p, v: v)
        }
        if menuState == 14 {
            if p.x > 55 && p.x < 55 + 110 && p.y > 92 && p.y < 92 + 110 {
                menuState = 4
            }
            
            
            
        }
        if menuState == 20 {
            let save = UserDefaults.standard
            if p.x > 55 && p.x < 55 + 110 && p.y > 92 && p.y < 92 + 110 {
                menuState = 4
            }
            if p.x > 150 && p.x < 150 + 164 && p.y > 345 && p.y < 345 + 88 {
                save.set(save.integer(forKey: "stars") - 10, forKey: "stars")
            }
            if p.x > 332 && p.x < 332 + 164 && p.y > 345 && p.y < 345 + 88 {
                save.set(save.integer(forKey: "stars") + 10, forKey: "stars")
            }
            
            if p.x > 150 && p.x < 150 + 164 && p.y > 608 && p.y < 608 + 88 {
                save.set(save.integer(forKey: "gstars") - 10, forKey: "gstars")
            }
            if p.x > 332 && p.x < 332 + 164 && p.y > 608 && p.y < 608 + 88 {
                save.set(save.integer(forKey: "gstars") + 10, forKey: "gstars")
            }
            
            //daily
            if p.x > 99 && p.x < 99 + 142 && p.y > 772 && p.y < 772 + 90 {
                save.set(save.integer(forKey: "dcDay") - 1, forKey: "dcDay")
                save.set(save.integer(forKey: "dcDayCount") + 1, forKey: "dcDayCount")
            }
            if p.x > 254 && p.x < 254 + 142 && p.y > 772 && p.y < 772 + 90 {
                save.set(save.integer(forKey: "dmoney") + 20, forKey: "dmoney")
                save.set(save.integer(forKey: "dgems") + 5, forKey: "dgems")
            }
        }
    }
    
    func leftSwipe(view v: ViewController) {
        //        if menuState == 7 {
        //            currentHelpPage += 1
        //            if currentHelpPage == 6 {
        //                let save = UserDefaults.standard
        //                save.set(true, forKey: "helpshowed")
        //                helpPages[helpPages.count-1].speed = 40
        //                currentHelpPage = 20
        //                bgAlpha += 4
        //                selectModeAnim = true
        //                let lvlpacks = LSLevelPacks()
        //                v.currentPack = lvlpacks.pack1
        //                v.lvl.lvlTurn = false
        //                lvlpacks.pack1.pages[0].levelLoad(level: v.lvl, levelnum: 0, v: v)
        //                v.lvl.lvlPlay = true
        //            }
        //        }
    }
    
    func rightSwipe() {
        if menuState == 7 {
            currentHelpPage -= 1
        }
    }
    
    
}

