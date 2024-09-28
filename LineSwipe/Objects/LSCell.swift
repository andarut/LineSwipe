//
//  HECell.swift
//  LineSwipe
//
//  Created by Daniil Belov on 09.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSCell {
    var width = 125.0
    var height = 125.0
    
    var scale = 1.0
    //3x3 - scale 1.34
    
    var x = 1.0
    var y = 1.0
    
    var moveX = 0.0
    var moveY = 0.0
    
    var sprites = ["cell0", "cell1", "cell2", "cell3", "cell4", "cell5", "cell6", "cell7", "cell8", "cell9", "cell10", "cell11", "cell12", "cell13"]
    
    var color = 1
    
    var viewY = 0.0
    
    func updateView(frame f: HEGameFrame, level l: LSLevel) {
        if l.cb {
            sprites = ["cbcell0", "cbcell1", "cbcell2", "cbcell3", "cbcell4", "cbcell5", "cbcell6", "cbcell7", "cbcell8", "cbcell9", "cell10", "cell11", "cbcell12", "cbcell13"]
        } else {
            sprites = ["cell0", "cell1", "cell2", "cell3", "cell4", "cell5", "cell6", "cell7", "cell8", "cell9", "cell10", "cell11", "cell12", "cell13"]
        }
        f.addImageToView(img: sprites[color], xpos: x*scale + moveX*scale + l.x, ypos: y*scale + moveY*scale + l.y + viewY, w: width*scale, h: height*scale)
    }
}
