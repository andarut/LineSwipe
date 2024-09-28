//
//  LSSlider.swift
//  LineSwipe
//
//  Created by Daniil Belov on 19.05.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

class LSSlider {
    var max = 10.0
    var value = 9.0
    
    var y = 0.0
    
    func updateView(frame f: HEGameFrame) {
        f.addImageToViewWithAlpha(img: "slider.png", xpos: 71, ypos: y+21, w: 497, h: 15, alpha: 1)
        f.addImageToViewWithAlpha(img: "slider_point", xpos: 71 + (max/497 + value/497), ypos: y, w: 58, h: 58, alpha: 1)
    }
}
