//
//  LSWhatsNew.swift
//  LineSwipe
//
//  Created by Daniil Belov on 30.03.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSWhatsNew {
    var page = 1
    
    func updateScreen(frame f: HEGameFrame) {
        let save = UserDefaults.standard
        if !save.bool(forKey: "wnv02b12") {
            if page == 1 {
                f.addImageToViewWithAlpha(img: "wn1.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: 1)
            }
            if page == 2 {
                f.addImageToViewWithAlpha(img: "wn2.png", xpos: 0, ypos: 0, w: 640, h: 1136, alpha: 1)
            }
        }
    }
    
    func nextPage() {
        page += 1
    }
}
