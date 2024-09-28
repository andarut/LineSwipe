//
//  LSBackgroundAnimation.swift
//  LineSwipe
//
//  Created by Daniil Belov on 23.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSBackgroundAnimation {
    var alpha = CGFloat(1.0)
    var tic = 0
    func updateView(frame f: HEGameFrame) {
        if tic > 20 {
            if alpha >= 0 {
                alpha -= 0.1
            }
        } else {
            tic += 1
        }
        if alpha >= 0 {
            f.addImageToViewWithAlpha(img: "menubg.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: alpha)
        }
    }
}
