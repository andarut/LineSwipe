//
//  LSLevelsPage.swift
//  LineSwipe
//
//  Created by Daniil Belov on 17.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSLevelsPage {
    var levels : [LSLevel]
    var buttons : [LSLevelButton]
    
    var moveX = 0.0
    var moveXTarget = 0.0
    
    var moveY = 0.0
    
    var movY = 0.0
    
    var lvls = LSLevels()
    
    var enable = false
    
    var starsforenable = 0
    
    var sound = LSSounds()
    
    var energyBanner = LSEnergyBanner()
    
    init() {
        levels = [lvls.lvl0_1, lvls.lvl0_2, lvls.lvl0_3, lvls.lvl0_4, lvls.lvl0_5, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1]
        buttons = [LSLevelButton(level: lvls.lvl1)]
        buttons.removeAll()
        for i in levels {
            buttons.append(LSLevelButton(level: i))
        }
    }
    init(levels l : [LSLevel]) {
        levels = l
        buttons = [LSLevelButton(level: lvls.lvl1)]
        buttons.removeAll()
        for i in levels {
            buttons.append(LSLevelButton(level: i))
        }
    }
    
    func updateView(frame f: HEGameFrame, mX: Double) {
        //alpha
        if enable {
            for i in buttons {
                i.alpha = 1
            }
        } else {
            for i in buttons {
                i.alpha = 0.2
            }
        }
        //anim
        if moveX < moveXTarget {
            moveX += (moveXTarget - moveX) / 4
        }
        if moveX > moveXTarget {
            moveX -= (moveX - moveXTarget) / 4
        }
        
        for i in 0...buttons.count-1 {
            if i == 0 {
                buttons[i].x = 70
                buttons[i].y = 239
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            } else if i == 1 {
                buttons[i].x = 245
                buttons[i].y = 239
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            } else if i == 2 {
                buttons[i].x = 420
                buttons[i].y = 239
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            } else if i == 3 {
                buttons[i].x = 159
                buttons[i].y = 462
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            } else if i == 4 {
                buttons[i].x = 334
                buttons[i].y = 462
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            } else if i == 5 {
                buttons[i].x = 70
                buttons[i].y = 685
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            } else if i == 6 {
                buttons[i].x = 245
                buttons[i].y = 685
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            } else if i == 7 {
                buttons[i].x = 420
                buttons[i].y = 685
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            } else if i == 8 {
                buttons[i].x = 159
                buttons[i].y = 908
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            } else if i == 9 {
                buttons[i].x = 334
                buttons[i].y = 908
                buttons[i].updateView(frame: f, moveX: mX, moveY: moveY + movY)
            }
        }
        if !enable {
            f.addImageToView(img: "pagelock.png", xpos: 77 + mX, ypos: 230 + moveY + movY+200, w: 480, h: 480)
            let save = UserDefaults.standard
            f.addTextToView(x: 320 + mX, y: 600 + moveY + movY+200, width: 800, height: 100, align: .center, font: "Lato-Light", size: 46, color: .black, text: "\(save.integer(forKey: "stars"))/\(starsforenable)")
            //enable
            if save.integer(forKey: "stars") >= starsforenable {
                enable = true
            }
        }
    }
    
    func levelLoad(level l: LSLevel, levelnum ln: Int, v: ViewController) {
        sound.open()
        let ll = levels[ln]
        l.mix = ll.mix
        l.mix_count = ll.mix_count
        l.mix_r_or_c = ll.mix_r_or_c
        l.mix_direction = ll.mix_direction
        l.mix_num = ll.mix_num
        l.mixing_a = ll.mixing_a
        
        l.moneyBar.view = false
        l.moneyBar.yT = -100
        l.moneyBar.y = -100
        l.moneyBar.vTic = 0
        l.size = ll.size
        l.bg = ll.bg
        l.cells = ll.cells
        l.colors = ll.colors
        l.winColors = ll.winColors
        l.complete = ll.complete
        l.timeMode = ll.timeMode
        l.sec = ll.sec
        l.scale = ll.scale
        l.winTic = ll.winTic
        l.lvlIcon = ll.lvlIcon
        l.lvlID = ll.lvlID
        l.gameovertype = ll.gameovertype
        l.notcomplete = ll.notcomplete
        l.uID = ll.uID
        l.winType = ll.winType
        l.starcounter_value = ll.starcounter_value
        l.starcounter_speed = ll.starcounter_speed
        l.helpState = ll.helpState
        l.helpCell.x = ll.helpCell.x
        l.steps = ll.steps
        l.winBanner = LSWinBanner()
        l.restartPanel = LSRestartPanel()
        l.isStart = true
        v.lvl.countersUpdated1 = false
        v.relvl = ll
        //l.start_mix()
        l.load()
    }
    
    func compareTouch(point p: HEPoint, level l: LSLevel, v: ViewController) {
        let save = UserDefaults.standard
        if l.lvlTurn {
            if enable {
                for i in 0...buttons.count-1 {
                    if p.x > buttons[i].x  && p.x < buttons[i].x + 147 && p.y - moveY - movY > buttons[i].y  && p.y - moveY - movY < buttons[i].y + 147 {
                        save.set(save.integer(forKey: "startLevelCount")+1, forKey: "startLevelCount")
                        if save.string(forKey: buttons[i].level.uID+"savedBG") != nil || save.integer(forKey: "energy") > 0 {
                            levelLoad(level: l, levelnum: i, v: v)
                            l.lvlTurn = false
                            l.viewYTarget = 0
                            l.lvlPlay = true
                            let save = UserDefaults.standard
                            save.set(l.colors, forKey: "savedStartColors")
                            save.set(l.steps, forKey: "savedStartSteps")
                            save.set(l.sec, forKey: "savedStartSec")
                            if save.string(forKey: buttons[i].level.uID+"savedBG") == nil {
                                save.set(save.integer(forKey: "energy")-1, forKey: "energy")
                            }
                        } else {
                            v.energyBanner.viewPanel()
                        }
                    }
                }
            }
            v.lvl.windowVibrate()
            v.lvl.vibrated = false
        }
    }
}
