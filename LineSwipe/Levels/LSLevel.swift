//
//  LSLevel.swift
//  LineSwipe
//
//  Created by Daniil Belov on 10.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

class LSLevel {
    var saveSt = false
    
    var langs = LSLanguage()
    
    var size: Int
    
    var isStart = true
    
    var alarm = "alarm.png"
    
    let save = UserDefaults.standard
    
    var cells = [[LSCell]]()
    var colors = [[Int]]()
    var winColors = [[Int]]()
    
    var moveLines = [Double]()
    var moveColumn = [Double]()
    
    var complete = false
    
    //заменяет побыду на проигрыш если complete = true
    var notcomplete = false
    var gameovertype = 0 //0 - time up   1 - turns up
    
    var x = 70.0
    var y = 358.0
    
    var bg = "lvlbg.png"
    
    var lvlIcon = "lvl0.png"
    
    var scale = 1.0
    
    var helpCell = LSCell()
    var hcX = 0
    var hcY = 0
    
    var timeMode = false
    var sec = 0
    
    var lvlID = 1
    
    var sounds = LSSounds()
    
    var soundOn = true
    
    var viewY = 0.0
    var viewYTarget = 0.0
    
    var lvlTurn = false
    
    var lvlPlay = true
    
    //complete delay
    var winTic = 0
    
    var uID = "m0s0"
    
    var winType = 0
    
    //star counter
    var starcounter_value = 492.0
    var starcounter_speed = 0.1
    
    var showText = true
    
    var shelp = LSSwipeHelp()
    var helpState = 0
    
    var winAlpha = 0.0
    
    var saveTic = 0
    
    //steps
    var steps = 0
    
    var winBanner = LSWinBanner()
    
    var rX = 133.0
    var rY = 70.0
    var rS = 46.0
    
    var restartPanel = LSRestartPanel()
    
    var levelIcon = LSLevelIcon()
    
    //mixing
    var mix = false
    var mix_count = 10
    var mix_r_or_c = 0
    var mix_num = 0
    var mix_direction = 0
    var mix_tic = 0
    
    var mixing_a = 1.0
    
    var ta = 0.0
    
    var gSG = false
    
    var bonusGived = false
    
    var moneyBar = LSMoneyBenner()
    
    var vibrated = false
    
    var cb = false
    
    var countersUpdated = false
    var countersUpdated1 = false
    
    init(size s: Int) {
        //hide help cell
        helpCell.x = -125
        helpCell.y = -125
        //create cells
        for _ in 0...s-1 {
            var newCells = [LSCell]()
            for _ in 0...s-1 {
                let newCell = LSCell()
                newCells.append(newCell)
            }
            cells.append(newCells)
        }
        //size scale
        if s == 3 {
            scale = 1.335
        } else if s == 5 {
            scale = 0.800
        } else if s == 6 {
            scale = 0.6675
        } else if s == 7 {
            scale = 0.572
        } else if s == 8 {
            scale = 0.5
        } else if s == 9 {
            scale = 0.445
        }
        
        //set position
        for i in 0...s-1 {
            for ii in 0...s-1 {
                cells[i][ii].x = Double(0+125*ii)
                cells[i][ii].y = Double(0+125*i)
            }
        }
        //create color massive
        for _ in 0...s-1 {
            var newColors = [Int]()
            for _ in 0...s-1 {
                newColors.append(1)
            }
            colors.append(newColors)
        }
        //create win color massive
        for _ in 0...s-1 {
            var newColors = [Int]()
            for _ in 0...s-1 {
                newColors.append(1)
            }
            winColors.append(newColors)
        }
        //create mov x y line massive
        for _ in 0...s+2 {
            moveLines.append(0.0)
            moveColumn.append(0.0)
        }
        
        size = s
        //        if !timeMode {
        //            starcounter_speed = (492.0 / Double(steps)) - 2.0
        //        }
    }
    
    func updateView(frame: HEGameFrame, mf: HEGameFrame, v: ViewController) {
        
        //block turn if dc
        if uID == "dclvl" {
            if !complete {
                lvlTurn = false
            }
        }
        if isStart {
            if !timeMode {
                starcounter_speed = (492.0 / Double(steps)) - 0.1
            } else {
                starcounter_speed = (492 / Double(sec)) - 0.1
            }
            isStart = false
        }
        if uID != "m0l1" && uID != "m0l2" {
            showText = true
        }
        //pause if turn
        if lvlTurn {
            lvlPlay = false
        }
        
        
        
        //return line move
        for i in 0...size-1 {
            if moveLines[i] > 0 {
                moveLines[i] -= moveLines[i]/2
            }
            if moveLines[i] < 0 {
                moveLines[i] += moveLines[i] / -2
            }
        }
        //return column move
        for i in 0...size-1 {
            if moveColumn[i] > 0 {
                moveColumn[i] -= moveColumn[i]/2
            }
            if moveColumn[i] < 0 {
                moveColumn[i] += moveColumn[i] / -2
            }
        }
        
        //turn up down animation
        if viewY < viewYTarget {
            viewY += (viewYTarget - viewY) / 8
        } else if viewY > viewYTarget {
            viewY -= (viewY - viewYTarget) / 8
        }
        
        //move help cell
        helpCell.moveX = moveLines[hcX]
        helpCell.moveY = moveColumn[hcY]
        
        //compare win
        var cc = 1
        for i in 0...size-1 {
            for ii in 0...size-1 {
                if colors[i][ii] == winColors[i][ii] {
                    cc *= 1
                } else {
                    cc *= 0
                }
            }
        }
        if cc == 1 {
            win()
            if steps == 0 {
                steps = 6666
            }
        }
        //turn down if complete
        if complete {
            if winTic > 30 {
                winAlpha += 0.1
            }
            if winTic == 150 {
                lvlTurn = true
                viewYTarget = 950
                winTic = -1
            } else if winTic != -1 {
                winTic += 1
            }
        } else {
            winAlpha = 0.0
        }
        
        
        
        //update color
        for i in 0...size-1 {
            for ii in 0...size-1 {
                cells[i][ii].color = colors[i][ii]
                cells[i][ii].scale = scale
                //update line move
                cells[i][ii].moveX = moveLines[i]
                cells[i][ii].moveY = moveColumn[ii]
            }
        }
        
        //view
        if !mix {
            if viewY < 800 {
                for i in cells {
                    for ii in i {
                        ii.viewY = self.viewY
                        ii.updateView(frame: frame, level: self)
                    }
                }
            }
        }
        if lvlTurn == false && viewY < 5 {
            helpCell.updateView(frame: frame, level: self)
            helpCell.scale = scale
        }
        //compare and light ok cells
        for i in 0...size-1 {
            for ii in 0...size-1 {
                if colors[i][ii] == winColors[i][ii] {
                    if save.string(forKey: "markerSkin") != nil {
                        frame.addImageToView(img: v.save.string(forKey: "markerSkin")!, xpos: cells[i][ii].x*scale + x, ypos: cells[i][ii].y*scale + y + viewY, w: 125*scale, h: 125*scale)
                    } else {
                        frame.addImageToView(img: "okCell.png", xpos: cells[i][ii].x*scale + x, ypos: cells[i][ii].y*scale + y + viewY, w: 125*scale, h: 125*scale)
                    }
                }
            }
        }
        frame.addImageToView(img: bg, xpos: 0, ypos: 0 + viewY, w: 640, h: 1136)
        //frame.addImageToView(img: lvlIcon, xpos: 472, ypos: 234 + viewY, w: 98, h: 98)
        //lvl icon
        levelIcon.size = size
        levelIcon.colors = winColors
        levelIcon.movY = viewY
        if !mix {
            levelIcon.updateView(frame: frame, cb: cb)
        }
        frame.addImageToView(img: alarm, xpos: 79, ypos: 287 + viewY, w: 45, h: 49)
        frame.addImageToView(img: "steps.png", xpos: 294, ypos: 286+viewY, w: 36, h: 50)
        //time label
        if showText {
            if !mix {
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
                frame.addTextToView(x: 100+136, y: 18+298 + viewY, width: 200, height: 100, align: .left, font: "Lato-Light", size: 46, color: .white, text: timeView)
                //steps level
                if steps != 6666 && !timeMode {
                    frame.addTextToView(x: 100+340, y: 18+298 + viewY, width: 200, height: 100, align: .left, font: "Lato-Light", size: 46, color: .white, text: String(steps))
                } else if timeMode {
                    frame.addTextToView(x: 100+340, y: 18+298 + viewY, width: 200, height: 100, align: .left, font: "Lato-Light", size: 46, color: .white, text: String(steps))
                } else {
                    frame.addTextToView(x: 100+340, y: 18+298 + viewY, width: 200, height: 100, align: .left, font: "Lato-Light", size: 46, color: .white, text: String(0))
                }
            }
        }
        
        //no steps
        if !timeMode {
            if steps == 0 {
                complete = true
                gameovertype = 0
                notcomplete = true
            }
        }
        
        
        //level id
        winBanner.movY = viewY
        if complete {
            if notcomplete {
                if gameovertype == 0 {
                    if timeMode {
                        if uID != "genlvl" && uID != "dclvl" {
                            frame.addTextToView(x: -80+397-54, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][1]+" "+String(lvlID))
                        } else if uID != "dclvl" {
                            frame.addTextToView(x: -80+397-54, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][9])
                        } else {
                            frame.addTextToView(x: -80+397-54, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][10])
                        }
                    } else {
                        if uID != "genlvl" && uID != "dclvl" {
                            frame.addTextToView(x: -80+397-54, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][1]+" "+String(lvlID))
                        } else if uID != "dclvl" {
                            frame.addTextToView(x: -80+397-54, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][9])
                        } else {
                            frame.addTextToView(x: -80+397-54, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][10])
                        }
                    }
                    frame.addImageToView(img: "level_fail.png", xpos: 538, ypos: 77+viewY, w: 31, h: 31)
                } else {
                    frame.addTextToView(x: -80+397, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: "LEVEL "+String(lvlID) + ": NO TURNS")
                }
            } else {
                if uID != "genlvl" && uID != "dclvl" {
                    frame.addTextToView(x: -80+397-54, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][1]+" "+String(lvlID))
                } else if uID == "dclvl" {
                    frame.addTextToView(x: -80+397-54, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][10])
                } else {
                    frame.addTextToView(x: -80+397-54, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][9])
                }
                frame.addImageToView(img: "lvl_complete.png", xpos: 530, ypos: 81+viewY, w: 39, h: 27)
            }
        } else {
            if uID != "genlvl" && uID != "dclvl" {
                frame.addTextToView(x: -80+397, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][1]+" "+String(lvlID))
            } else if uID != "dclvl" {
                frame.addTextToView(x: -80+397, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][9])
            } else {
                frame.addTextToView(x: -80+397, y: 16+77 + viewY, width: 500, height: 100, align: .right, font: "Lato-Black", size: 46, color: .white, text: langs.langs[LSLanguage.lang][10])
            }
        }
        //397 77
        
        
        
        //complete or game over title
        if complete {
            save.set(nil, forKey: uID+"savedBG")
            frame.addImageToViewWithAlpha(img: "winbg.png", xpos: 70, ypos: 358 + viewY, w: 500, h: 500, alpha: 0.0)
            if notcomplete {
                if gameovertype == 0 {
                    //frame.addImageToView(img: "timeup.png", xpos: 70, ypos: 338 + viewY, w: 500, h: 500)
                }
            } else {
                //awesome
                if winType == 1 {
                    //frame.addImageToViewWithAlpha(img: "win3.png", xpos: 70, ypos: 358 + viewY, w: 500, h: 500, alpha: CGFloat(winAlpha))
                }
                //excelent
                if winType == 2 {
                    //frame.addImageToViewWithAlpha(img: "win2.png", xpos: 70, ypos: 358 + viewY, w: 500, h: 500, alpha: CGFloat(winAlpha))
                }
                //good
                if winType == 3 {
                    //frame.addImageToViewWithAlpha(img: "win1.png", xpos: 70, ypos: 358 + viewY, w: 500, h: 500, alpha: CGFloat(winAlpha))
                }
                //slowpoke
                if winType == -1 {
                    //frame.addImageToViewWithAlpha(img: "win4.png", xpos: 70, ypos: 358 + viewY, w: 500, h: 500, alpha: CGFloat(winAlpha))
                }
            }
        }
        
        //stars counter
        if complete == false {
            if lvlPlay {
                if starcounter_value > 0 {
                    if timeMode {
                        //starcounter_value -= starcounter_speed
                    }
                }
            }
        }
        frame.addImageToView(img: "starscounter.png", xpos: 70, ypos: 888 + viewY, w: 500, h: 58)
        frame.addImageToView(img: "starscounterfill.png", xpos: 74, ypos: 888 + viewY, w: starcounter_value, h: 8)
        frame.addImageToView(img: "counterround.png", xpos: 70, ypos: 888 + viewY, w: 8, h: 8)
        frame.addImageToView(img: "counterround.png", xpos: 70 + starcounter_value, ypos: 888 + viewY, w: 8, h: 8)
        //stars view
        if uID == "genlvl" || uID == "dclvl" {
            if winType == 1 {
                frame.addImageToViewWithAlpha(img: "gstar1.png", xpos: 402, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
                frame.addImageToViewWithAlpha(img: "gstar2.png", xpos: 237, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
                frame.addImageToViewWithAlpha(img: "gstar3.png", xpos: 83, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
            } else if winType == 2 {
                frame.addImageToViewWithAlpha(img: "gstar1.png", xpos: 402, ypos: 911 + viewY, w: 42, h: 42, alpha: 0.5)
                frame.addImageToViewWithAlpha(img: "gstar2.png", xpos: 237, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
                frame.addImageToViewWithAlpha(img: "gstar3.png", xpos: 83, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
            } else if winType == 3 {
                frame.addImageToViewWithAlpha(img: "gstar1.png", xpos: 402, ypos: 911 + viewY, w: 42, h: 42, alpha: 0.5)
                frame.addImageToViewWithAlpha(img: "gstar2.png", xpos: 237, ypos: 911 + viewY, w: 42, h: 42, alpha: 0.5)
                frame.addImageToViewWithAlpha(img: "gstar3.png", xpos: 83, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
            }
        } else {
            if winType == 1 {
                frame.addImageToViewWithAlpha(img: "star1.png", xpos: 402, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
                frame.addImageToViewWithAlpha(img: "star2.png", xpos: 237, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
                frame.addImageToViewWithAlpha(img: "star3.png", xpos: 83, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
            } else if winType == 2 {
                frame.addImageToViewWithAlpha(img: "star1.png", xpos: 402, ypos: 911 + viewY, w: 42, h: 42, alpha: 0.5)
                frame.addImageToViewWithAlpha(img: "star2.png", xpos: 237, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
                frame.addImageToViewWithAlpha(img: "star3.png", xpos: 83, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
            } else if winType == 3 {
                frame.addImageToViewWithAlpha(img: "star1.png", xpos: 402, ypos: 911 + viewY, w: 42, h: 42, alpha: 0.5)
                frame.addImageToViewWithAlpha(img: "star2.png", xpos: 237, ypos: 911 + viewY, w: 42, h: 42, alpha: 0.5)
                frame.addImageToViewWithAlpha(img: "star3.png", xpos: 83, ypos: 911 + viewY, w: 42, h: 42, alpha: 1)
            }
        }
        
        //update stars
        winType = 1
        if starcounter_value < 319 {
            winType = 2
        }
        if starcounter_value < 154 {
            winType = 3
        }
        if starcounter_value < 1 {
            winType = -1
        }
        
        //view help
        //        if uID == "m0l1" || uID == "m0l2" {
        //            shelp.updateView(frame: frame, moveX: 0, moveY: viewY)
        //            if uID == "m0l1" {
        //                if helpState == 0 {
        //                    showText = false
        //                    if !lvlTurn {
        //                        frame.addImageToViewWithAlpha(img: "firsthelp.png", xpos: 0, ypos: viewY, w: 640, h: 1136, alpha: 1)
        //                    }
        //                    shelp.x = 417
        //                    shelp.y = 405
        //                } else if helpState == 1 {
        //                    frame.addImageToViewWithAlpha(img: "firstswipe.png", xpos: 70, ypos: 525 + viewY, w: 500, h: 333, alpha: 1)
        //                    showText = true
        //                    shelp.startX = 417
        //                    shelp.startY = 405
        //                    shelp.targetX = 150
        //                    shelp.targetY = 405
        //                } else if helpState == 2 {
        //                    shelp.startX = 116
        //                    shelp.startY = 438
        //                    shelp.targetX = 116
        //                    shelp.targetY = 705
        //                }
        //            } else {
        //                showText = true
        //            }
        //            if uID == "m0l2" {
        //                if helpState == 0 {
        //                    shelp.startX = 116
        //                    shelp.startY = 438
        //                    shelp.targetX = 116
        //                    shelp.targetY = 705
        //                } else if helpState == 1 {
        //                    shelp.startX = 451
        //                    shelp.startY = 705
        //                    shelp.targetX = 451
        //                    shelp.targetY = 438
        //                } else if helpState == 2 {
        //                    shelp.startX = 150
        //                    shelp.startY = 405
        //                    shelp.targetX = 417
        //                    shelp.targetY = 405
        //                } else if helpState == 3 {
        //                    shelp.startX = 417
        //                    shelp.startY = 738
        //                    shelp.targetX = 150
        //                    shelp.targetY = 738
        //                }
        //            }
        //        }
        
        frame.addImageToViewWithAlpha(img: "mixing.png", xpos: 0, ypos: 0+viewY, w: 640, h: 1136, alpha: CGFloat(mixing_a))
        
        
        
        
        
        //lvl turn
        if lvlTurn == true {
            viewYTarget = 890
        } else {
            viewYTarget = 0
        }
        if complete {
            winBanner.updateView(frame: frame)
            winBanner.winType = winType
            winBanner.notComplete = notcomplete
            winBanner.timeMode = timeMode
        }
        //save progress
        if saveTic > 20 {
            if !lvlTurn && uID != "dclvl" {
                let save = UserDefaults.standard
                save.set(size, forKey: "savedSize")
                save.set(bg, forKey: "savedBG")
                save.set(colors, forKey: "savedColors")
                save.set(winColors, forKey: "savedWinColors")
                save.set(complete, forKey: "savedComplete")
                save.set(sec, forKey: "savedSec")
                save.set(timeMode, forKey: "savedTimeMode")
                save.set(scale, forKey: "savedScale")
                save.set(winTic, forKey: "savedWinTic")
                save.set(lvlIcon, forKey: "savedLvlIcon")
                save.set(lvlID, forKey: "savedLvlID")
                save.set(gameovertype, forKey: "savedGameOverType")
                save.set(notcomplete, forKey: "savedNotComplete")
                save.set(uID, forKey: "savedUID")
                save.set(winType, forKey: "savedWinType")
                save.set(starcounter_value, forKey: "savedStarcounter_value")
                save.set(starcounter_speed, forKey: "savedStarcounter_speed")
                save.set(helpState, forKey: "savedHelpState")
                save.set(steps, forKey: "savedSteps")
                save.set(lvlTurn, forKey: "savedLvlTurn")
                
                //saveWithUID
                save.set(size, forKey: uID+"savedSize")
                save.set(bg, forKey: uID+"savedBG")
                save.set(colors, forKey: uID+"savedColors")
                save.set(winColors, forKey: uID+"savedWinColors")
                save.set(complete, forKey: uID+"savedComplete")
                save.set(sec, forKey: uID+"savedSec")
                save.set(timeMode, forKey: uID+"savedTimeMode")
                save.set(scale, forKey: uID+"savedScale")
                save.set(winTic, forKey: uID+"savedWinTic")
                save.set(lvlIcon, forKey: uID+"savedLvlIcon")
                save.set(lvlID, forKey: uID+"savedLvlID")
                save.set(gameovertype, forKey: uID+"savedGameOverType")
                save.set(notcomplete, forKey: uID+"savedNotComplete")
                save.set(uID, forKey: uID+"savedUID")
                save.set(winType, forKey: uID+"savedWinType")
                save.set(starcounter_value, forKey: uID+"savedStarcounter_value")
                save.set(starcounter_speed, forKey: uID+"savedStarcounter_speed")
                save.set(helpState, forKey: uID+"savedHelpState")
                save.set(steps, forKey: uID+"savedSteps")
                save.set(lvlTurn, forKey: uID+"savedLvlTurn")
            } else {
                let save = UserDefaults.standard
                save.set(lvlTurn, forKey: "savedLvlTurn")
            }
            saveTic = 0
        } else {
            saveTic += 1
        }
        //mixing
        if mix {
            if mix_tic > 2 {
                if mix_count != 0 {
                    mix_r_or_c = Int(arc4random_uniform(2))
                    mix_num = Int(arc4random_uniform(UInt32(size-1)))
                    mix_direction = Int(arc4random_uniform(2))
                    if mix_r_or_c == 0 {
                        //top-down
                        if mix_direction == 0 {
                            moveUp(left: mix_num)
                        } else {
                            moveDown(left: mix_num)
                        }
                    } else {
                        if mix_direction == 0 {
                            moveLeft(top: mix_num)
                        } else {
                            moveRight(top: mix_num)
                        }
                    }
                    mix_count -= 1
                    starcounter_value = 492
                } else {
                    mix = false
                }
                mix_tic = 0
            } else {
                mix_tic += 1
            }
        } else {
            if mixing_a >= 0 {
                mixing_a -= 0.1
            }
        }
        restartPanel.updateView(frame: mf)
        
        if lvlTurn {
            viewYTarget = 950
            if ta <= 1 {
                ta += 1
            }
        } else {
            if ta >= 0 {
                ta -= 1
            }
        }
        if ta > 0 {
            //frame.addImageToViewWithAlpha(img: "lvlbg.png", xpos: 0, ypos: 0+viewY, w: 640, h: 1136, alpha: CGFloat(ta))
        }
        //view upBotton
        if uID != "dclvl" {
            if lvlTurn {
                frame.addImageToView(img: "up.png", xpos: 70, ypos: 70 + viewY, w: 46, h: 46)
            } else {
                frame.addImageToView(img: "down.png", xpos: 70, ypos: 70 + viewY, w: 46, h: 46)
                frame.addImageToView(img: "restart.png", xpos: rX, ypos: rY+viewY, w: rS, h: rS)
            }
        }
        
        //round if turn down
        if viewY > 5 {
            frame.addImageToView(img: "monu-angle.png", xpos: 0, ypos: viewY, w: 640, h: 186)
        }
        if steps == -100 {
            steps = 0
        }
        if steps >= 6678 {
            steps = 0
        }
        moneyBar.updateView(frame: mf, v: v)
        
        if lvlTurn == true {
            //viewYTarget = 890
        }
        if !timeMode && steps == 6666 && complete {
            starcounter_value = 20
            winType = 2
            notcomplete = false
        }
    }
    
    func setColor(color c: Int, top t: Int, left l: Int) {
        colors[t][l] = c
    }
    func setWinColor(color c: Int, top t: Int, left l: Int) {
        winColors[t][l] = c
    }
    
    func load() {
        if save.string(forKey: uID+"savedBG") != nil {
            self.bg = save.string(forKey: uID+"savedBG")!
            self.colors = save.array(forKey: uID+"savedColors") as! [[Int]]
            self.winColors = save.array(forKey: uID+"savedWinColors") as! [[Int]]
            self.complete = save.bool(forKey: uID+"savedComplete")
            self.sec = save.integer(forKey: uID+"savedSec")
            self.timeMode = save.bool(forKey: uID+"savedTimeMode")
            self.scale = save.double(forKey: uID+"savedScale")
            self.lvlIcon = save.string(forKey: uID+"savedLvlIcon")!
            self.lvlID = save.integer(forKey: uID+"savedLvlID")
            self.uID = save.string(forKey: uID+"savedUID")!
            self.starcounter_value = save.double(forKey: uID+"savedStarcounter_value")
            self.starcounter_speed = save.double(forKey: uID+"savedStarcounter_speed")
            self.helpState = save.integer(forKey: uID+"savedHelpState")
            self.steps = save.integer(forKey: uID+"savedSteps")
        }
    }
    
    func start_mix() {
        if size == 3 {
            mix_count = 5
        } else if size == 4 {
            mix_count = 12
        } else if size == 5 {
            mix_count = 25
        } else if size == 6 {
            mix_count = 40
        }
        mix = true
        steps += mix_count
    }
    
    func moveLeft(top t: Int) {
        //create on time massive
        if !complete {
            var newcolors = colors[t]
            for i in 0...size-1 {
                if i == size-1 {
                    newcolors[i] = colors[t][0]
                    helpCell.color = colors[t][0]
                } else {
                    newcolors[i] = colors[t][i+1]
                }
            }
            colors[t] = newcolors
            moveLines[t] = 125.0
            if timeMode {
                steps += 1
            } else {
                steps -= 1
            }
            //help cell
            hcX = t
            helpCell.x = -125
            helpCell.y = Double(125 * t)
            if !mix {
                sounds.swipe()
            }
            if !timeMode {
                starcounter_value -= starcounter_speed
            }
            moveVibrate()
        }
        if uID == "m0l1" {
            if helpState == 1 {
                helpState = 2
                shelp.x = 116
                shelp.y = 438
            }
        }
    }
    func moveRight(top t: Int) {
        if !complete {
            //create on time massive
            var newcolors = colors[t]
            for i in 0...size-1 {
                if i == 0 {
                    newcolors[i] = colors[t][size-1]
                    helpCell.color = colors[t][size-1]
                } else {
                    newcolors[i] = colors[t][i-1]
                }
            }
            colors[t] = newcolors
            moveLines[t] = -125.0
            if timeMode {
                steps += 1
            } else {
                steps -= 1
            }
            //helpcell
            hcX = t
            helpCell.x = Double(125*size)
            helpCell.y = Double(125 * t)
            if !mix {
                sounds.swipe()
            }
            if !timeMode {
                starcounter_value -= starcounter_speed
            }
            moveVibrate()
        }
        if uID == "m0l2" {
            if helpState == 2 {
                helpState = 3
                shelp.x = 150
                shelp.y = 738
            }
        }
    }
    
    func moveUp(left l: Int) {
        if !complete {
            var newColors = colors
            for i in 0...size-1 {
                if i == size-1 {
                    newColors[i][l] = colors[0][l]
                    helpCell.color = colors[0][l]
                } else {
                    newColors[i][l] = colors[i+1][l]
                }
            }
            colors = newColors
            moveColumn[l] = 125.0
            if timeMode {
                steps += 1
            } else {
                steps -= 1
            }
            //help cell
            hcY = l
            helpCell.y = Double(-125)
            helpCell.x = Double(125 * l)
            if !mix {
                sounds.swipe()
            }
            if !timeMode {
                starcounter_value -= starcounter_speed
            }
            if uID == "m0l2" {
                if helpState == 1 {
                    helpState = 2
                    shelp.x = 451
                    shelp.y = 405
                }
            }
            moveVibrate()
        }
    }
    func moveDown(left l: Int) {
        if !complete {
            var newColors = colors
            for i in 0...size-1 {
                if i == 0 {
                    newColors[i][l] = colors[size-1][l]
                    helpCell.color = colors[size-1][l]
                } else {
                    newColors[i][l] = colors[i-1][l]
                }
            }
            colors = newColors
            moveColumn[l] = -125.0
            if timeMode {
                steps += 1
            } else {
                steps -= 1
            }
            //help cell
            hcY = l
            helpCell.y = Double(125 * size)
            helpCell.x = Double(125 * l)
            if !mix {
                sounds.swipe()
            }
            if !timeMode {
                starcounter_value -= starcounter_speed
            }
            if uID == "m0l2" {
                if helpState == 0 {
                    helpState = 1
                    shelp.x = 451
                    shelp.y = 750
                }
            }
            moveVibrate()
        }
    }
    
    func compareLine(point p: HEPoint) -> Int {
        var line = -1
        for i in cells {
            for ii in i {
                if p.x - x > ii.x * scale && p.x - x < ii.x * scale + ii.width * scale && p.y - y > ii.y * scale && p.y - y < ii.y * scale + ii.width * scale {
                    line = Int(ii.y / 125.0)
                }
            }
        }
        return line
    }
    func compareСolumn(point p: HEPoint) -> Int {
        var column = -1
        for i in cells {
            for ii in i {
                if p.x - x > ii.x * scale && p.x - x < ii.x * scale + ii.width * scale && p.y - y > ii.y * scale && p.y - y < ii.y * scale + ii.width * scale {
                    column = Int(ii.x / 125.0)
                }
            }
        }
        return column
    }
    func updateTime() {
        cb = save.bool(forKey: "settings.color")
        if complete == false && lvlPlay {
            vibrated = false
            if lvlPlay {
                if starcounter_value > 0 {
                    if timeMode {
                        starcounter_value -= starcounter_speed
                    }
                }
            }
        }
        if lvlPlay {
            //ticVibrate()
            if complete == false {
                if timeMode {
                    sec -= 1
                    //time up
                    if sec == 0 {
                        complete = true
                        notcomplete = true
                        gameovertype = 0
                    }
                } else {
                    sec += 1
                }
            }
        }
    }
    func win() {
        if !timeMode && steps == 6666 {
            winType = 3
            notcomplete = false
        }
        if !vibrated {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.20, execute: {
                self.windowVibrate()
            })
            vibrated = true
        }
        saveSt = true
        //save win
        let save = UserDefaults.standard
        //add to ad counter
        if !notcomplete && !countersUpdated1  {
            save.set(save.integer(forKey: "countToBanner")+1, forKey: "countToBanner")
            save.set(save.integer(forKey: "mRR")+1, forKey: "mRR")
            countersUpdated1 = true
        }
        //not time mode
        save.set(nil, forKey: uID+"savedBG")
        if uID == "genlvl" || uID == "dclvl" {
            winBanner.s1 = "gws1.png"
            winBanner.s2 = "gws2.png"
            winBanner.s3 = "gws3.png"
        } else {
            winBanner.s1 = "ws1.png"
            winBanner.s2 = "ws2.png"
            winBanner.s3 = "ws3.png"
        }
        //banner
        if complete && !notcomplete && !lvlTurn {
            if uID != "dclvl" && uID != "genlvl" {
                if !save.bool(forKey: uID+"BonusGived") {
                    switch size {
                    case 3:
                        moneyBar.viewBar(money: 2, gems: 0)
                    case 4:
                        moneyBar.viewBar(money: 4, gems: 0)
                    case 5:
                        moneyBar.viewBar(money: 6, gems: 0)
                    case 6:
                        moneyBar.viewBar(money: 8, gems: 0)
                    default:
                        moneyBar.viewBar(money: 0, gems: 0)
                    }
                    save.set(true, forKey: uID+"BonusGived")
                }
            } else if uID == "dclvl" {
                switch save.integer(forKey: "dcDayCount") {
                case 0:
                    moneyBar.viewBar(money: 10, gems: 0)
                case 1:
                    moneyBar.viewBar(money: 12, gems: 0)
                case 2:
                    moneyBar.viewBar(money: 15, gems: 0)
                case 3:
                    moneyBar.viewBar(money: 15, gems: 0)
                case 4:
                    moneyBar.viewBar(money: 15, gems: 0)
                case 5:
                    moneyBar.viewBar(money: 20, gems: 0)
                case 6:
                    moneyBar.viewBar(money: 0, gems: 1)
                default:
                    moneyBar.viewBar(money: 0, gems: 0)
                }
            }
        }
        
        //give bonus if daily chalange
        if complete {
            if uID == "dclvl" {
                if !bonusGived {
//                    switch save.integer(forKey: "dcDayCounter") {
//                    case 0: save.set(save.integer(forKey: "dmoney")+5, forKey: "dmoney")
//                    case 1: save.set(save.integer(forKey: "dmoney")+12, forKey: "dmoney")
//                    case 2: save.set(save.integer(forKey: "dmoney")+15, forKey: "dmoney")
//                    case 3: save.set(save.integer(forKey: "dmoney")+15, forKey: "dmoney")
//                    case 4: save.set(save.integer(forKey: "dmoney")+15, forKey: "dmoney")
//                    case 5: save.set(save.integer(forKey: "dmoney")+20, forKey: "dmoney")
//                    case 6: save.set(save.integer(forKey: "dgems")+1, forKey: "dgems")
//                    default:
//                        save.set(save.integer(forKey: "dmoney")+5, forKey: "dmoney")
//                    }
                    bonusGived = true
                }
            }
        }
        if !mix {
            if uID != "genlvl" && uID != "dclvl"  {
                if !complete {
                    //add stars
                    if winType <= 3 {
                        if save.integer(forKey: "lc-"+uID) < 1 {
                            save.set(save.integer(forKey: "stars")+1, forKey: "stars")
                        }
                    }
                    if winType <= 2 {
                        if save.integer(forKey: "lc-"+uID) < 2 {
                            save.set(save.integer(forKey: "stars")+1, forKey: "stars")
                        }
                    }
                    if winType <= 1 {
                        if save.integer(forKey: "lc-"+uID) < 3 {
                            save.set(save.integer(forKey: "stars")+1, forKey: "stars")
                        }
                    }
                }
                
                complete = true
                //save
                if winType == -1 {
                    if save.integer(forKey: "lc-"+uID) != 1 && save.integer(forKey: "lc-"+uID) != 2 && save.integer(forKey: "lc-"+uID) != 3 {
                        save.set(-1, forKey: "lc-"+uID)
                    }
                }
                if winType == 3 {
                    if save.integer(forKey: "lc-"+uID) < 1 {
                        save.set(1, forKey: "lc-"+uID)
                    }
                }
                if winType == 2 {
                    if save.integer(forKey: "lc-"+uID) < 2 {
                        save.set(2, forKey: "lc-"+uID)
                    }
                }
                if winType == 1 {
                    if save.integer(forKey: "lc-"+uID) < 3 {
                        save.set(3, forKey: "lc-"+uID)
                    }
                }
            } else {
                if !gSG {
                    if winType <= 3 {
                        save.set(save.integer(forKey: "gstars")+1, forKey: "gstars")
                    }
                    if winType <= 2 {
                        save.set(save.integer(forKey: "gstars")+1, forKey: "gstars")
                    }
                    if winType <= 1 {
                        save.set(save.integer(forKey: "gstars")+1, forKey: "gstars")
                    }
                    gSG = true
                    complete = true
                }
            }
        }
        if lvlID == 0 {
            save.set(0, forKey: "lc-"+uID)
        }
    }
    func compareTouch(point p: HEPoint, view v: ViewController) {
        
        if uID == "m0l1" {
            if viewY < 1 {
                if helpState == 0 {
                    helpState = 1
                    shelp.x = 417
                    shelp.y = 405
                }
            }
        } else if uID == "m0l2" {
            
        }
        //turn button
        if complete == false || complete == true {
            if p.x > 70 - 20 && p.x < 70 + 46 + 20 && p.y > 70 - 20 + viewYTarget && p.y < 70 + 20 + 46 + viewYTarget {
                if lvlTurn {
                    viewYTarget = 0
                    lvlTurn = false
                    lvlPlay = true
                    sounds.open()
                } else {
                    viewYTarget = 950
                    lvlTurn = true
                    lvlPlay = false
                    sounds.close()
                }
            }
        }
        //restart
        if !lvlTurn && uID != "dclvl" {
            if p.x > rX && p.x < rX + rS && p.y > rY && p.y < rY + rS {
                restartPanel.viewPanel()
            }
        }
        restartPanel.compareTouch(point: p, view: v)
    }
    
    func moveVibrate() {
        if save.bool(forKey: "settings.taptic") {
            let pop = SystemSoundID(1520)
            AudioServicesPlaySystemSound(pop)
        }
    }
    
    func windowVibrate() {
        if save.bool(forKey: "settings.taptic") {
            let pop = SystemSoundID(1107)
            AudioServicesPlaySystemSound(pop)
        }
    }
    
    func ticVibrate() {
        if save.bool(forKey: "settings.taptic") {
            let peek = SystemSoundID(1519)
            AudioServicesPlaySystemSound(peek)
        }
    }
}
