//
//  LSShopButton.swift
//  LineSwipe
//
//  Created by Daniil Belov on 16.06.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

enum LSCurrency {
    case moneys
    case gems
}

class LSMarkerBuyButton {
    var buyed = false
    var currency = LSCurrency.moneys
    var price = 10
    
    var skinShopPreview = "skin0p.png"
    var skinGamePicture = "skin0.png"
    
    var x = 0.0
    var y = 0.0
    
    init(curency c: LSCurrency, price p: Int, buyed b: Bool, skinImage si: String, skinPreview sp: String) {
        currency = c
        price = p
        buyed = b
        skinGamePicture = si
        skinShopPreview = sp
    }
    
    func updateView(frame f: HEGameFrame, v: ViewController, movY: Double) {
        f.addImageToView(img: "shopbtn.png", xpos: x, ypos: y+movY, w: 142, h: 142)
        if buyed {
            f.addImageToView(img: skinShopPreview, xpos: x+44, ypos: y+44+movY, w: 53, h: 53)
        } else {
            switch currency {
                case .moneys:
                    f.addImageToView(img: "money.png", xpos: x+43, ypos: y+19+movY, w: 57, h: 57)
                case .gems:
                    f.addImageToView(img: "gems.png", xpos: x+43, ypos: y+19+movY, w: 57, h: 57)
            }
            f.addTextToView(x: x+68, y: y+106+movY, width: 800, height: 214, align: .center, font: "Lato-Light", size: 40, color: .black, text: "\(price)")
        }
    }
    
    func compareTouch(point p: HEPoint, v: ViewController, movY: Double) {
        if p.x > x && p.x < x + 142 && p.y > y+movY && p.y < (y+142)+movY {
            if buyed {
                v.save.set(skinGamePicture, forKey: "markerSkin")
                v.startMenu.menuState = 1
                v.startMenu.selectModeAnim = false
                v.startMenu.plAnim = 0
                v.startMenu.plScale = 0
                v.startMenu.alpha = 1
                v.startMenu.slPos = 0
                v.startMenu.mAlpha = 0
                v.startMenu.slAlpha = 0
                v.startMenu.mY = 200
                v.startMenu.dA = 1
            } else {
                if currency == .moneys {
                    if v.save.integer(forKey: "dmoney") >= price {
                        buyed = true
                        v.save.set(v.save.integer(forKey: "dmoney")-price, forKey: "dmoney")
                        v.save.set(true, forKey: skinShopPreview+"Buyed")
                    }
                }
                if currency == .gems {
                    if v.save.integer(forKey: "dgems") >= price {
                        buyed = true
                        v.save.set(v.save.integer(forKey: "dgems")-price, forKey: "dgems")
                        v.save.set(true, forKey: skinShopPreview+"Buyed")
                    }
                }
            }
        }
    }
}
