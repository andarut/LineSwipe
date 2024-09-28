//
//  LSLevelButton.swift
//  LineSwipe
//
//  Created by Daniil Belov on 16.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSLevelButton {
    
    var x = 0.0
    var y = 0.0
    
    var level : LSLevel
    
    var alpha = 1.0
    
    var icon = LSLevelIcon()
    
    init(level l: LSLevel) {
        self.level = l
        icon.size = l.size
        icon.colors = l.winColors
        icon.round = "scroundm.png"
    }
    
    func updateView(frame f: HEGameFrame, moveX: Double, moveY: Double) {
        let save = UserDefaults.standard
        let wintype = save.integer(forKey: "lc-"+level.uID)
        icon.movX = -472+x+30+moveX
        icon.movY = -234+y+30+moveY
        if wintype == 0 {
            f.addImageToViewWithAlpha(img: "lvl-button0.png", xpos: x + moveX, ypos: y + moveY, w: 155, h: 206, alpha: CGFloat(alpha))
        } else if wintype == 1 {
            f.addImageToViewWithAlpha(img: "lvl-button1.png", xpos: x + moveX, ypos: y + moveY, w: 155, h: 206, alpha: CGFloat(alpha))
        } else if wintype == 2 {
            f.addImageToViewWithAlpha(img: "lvl-button2.png", xpos: x + moveX, ypos: y + moveY, w: 155, h: 206, alpha: CGFloat(alpha))
        } else if wintype == 3 {
            f.addImageToViewWithAlpha(img: "lvl-button3.png", xpos: x + moveX, ypos: y + moveY, w: 155, h: 206, alpha: CGFloat(alpha))
        } else if wintype == -1 {
            f.addImageToViewWithAlpha(img: "lvl-button04.png", xpos: x + moveX, ypos: y + moveY, w: 147, h: 147, alpha: CGFloat(alpha))
        }
        
        
        
        if y+moveY > 100 && y+moveY < 1000 {
            f.addImageToViewWithAlpha(img: level.lvlIcon, xpos: x + 26 + moveX, ypos: y + 26 + moveY, w: 103, h: 103, alpha: CGFloat(alpha))
            //icon.updateView(frame: f, cb: level.cb)
        }
        if save.string(forKey: level.uID+"savedBG") != nil {
            f.addImageToView(img: "continuelvl", xpos: x + 26 + moveX, ypos: y + 26 + moveY, w: 103, h: 103)
        }
    }
}
