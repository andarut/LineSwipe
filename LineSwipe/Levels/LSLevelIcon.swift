//
//  LSLevelIcon.swift
//  LineSwipe
//
//  Created by Daniil Belov on 20.04.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSLevelIcon {
    var size = 4
    var colors = [[Int]]()
    
    var scale = 1.0
    
    var cells = ["scell1.png", "scell1.png", "scell2.png", "scell3.png", "scell4.png", "scell5.png", "scell6.png", "scell7.png", "scell8.png", "scell9.png", "scell10.png", "scell11.png", "scell12.png", "scell13.png"]
    
    var movY = 0.0
    var movX = 0.0
    
    var round = "scround.png"
    func updateView(frame f: HEGameFrame, cb: Bool) {
        if cb {
            cells = ["cbcell1.png", "cbcell1.png", "cbcell2.png", "cbcell3.png", "cbcell4.png", "cbcell5.png", "cbcell6.png", "cbcell7.png", "cbcell8.png", "cbcell9.png", "scell10.png", "scell11.png", "cbcell12.png", "cbcell13.png"]
        } else {
            cells = ["scell1.png", "scell1.png", "scell2.png", "scell3.png", "scell4.png", "scell5.png", "scell6.png", "scell7.png", "scell8.png", "scell9.png", "scell10.png", "scell11.png", "scell12.png", "scell13.png"]
        }
        //scale
        if size == 3 {
            scale = 1.335
        } else if size == 5 {
           scale = 0.800
        } else if size == 6 {
            scale = 0.6675
        } else if size == 4 {
            scale = 1
        } else if size == 7 {
            scale = 0.572
        } else if size == 8 {
            scale = 0.5
        } else if size == 9 {
            scale = 0.445
        }
        //f.addImageToView(img: "white.png", xpos: 472, ypos: 234+movY, w: 98, h: 98)
        for i in 0...size-1 {
            if size == 6 || size == 5 {
                for ii in 0...size-1 {
                    f.addImageToView(img: cells[colors[ii][i]], xpos: (24.5 * Double(i) * scale)+472+movX, ypos: (24.5 * Double(ii) * scale)+234+movY, w: 24.5*scale, h: 24.5*scale)
                }
            } else {
                for ii in 0...size-1 {
                    f.addImageToView(img: cells[colors[i][ii]], xpos: (24.5 * Double(ii) * scale)+472+movX, ypos: (24.5 * Double(i) * scale)+234+movY, w: 24.5*scale, h: 24.5*scale)
                }
            }
        }
        f.addImageToView(img: round, xpos: 470+movX, ypos: 232+movY, w: 102, h: 102)
    }
}
