//
//  LSMenuPage.swift
//  LineSwipe
//
//  Created by Daniil Belov on 16.06.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//
import UIKit

class LSShopPage {
    var movY = 0.0
    
    //scroll
    var startPos = 0.0
    var startTouch = 0.0
    var currentTouch = 0.0
    var endSpeed = 0.0
    
    var pEndSpeed = 0.0
    
    var minY = -80.0
    
    var scrolTic = 0
    
    var markers = [
        LSMarkerBuyButton(curency: .moneys, price: 0, buyed: true, skinImage: "marker0.png", skinPreview: "marker0p.png"),
        LSMarkerBuyButton(curency: .moneys, price: 5, buyed: false, skinImage: "marker1.png", skinPreview: "marker1p.png"),
        LSMarkerBuyButton(curency: .moneys, price: 10, buyed: false, skinImage: "marker2.png", skinPreview: "marker2p.png"),
        LSMarkerBuyButton(curency: .moneys, price: 20, buyed: false, skinImage: "marker3.png", skinPreview: "marker3p.png"),
        LSMarkerBuyButton(curency: .moneys, price: 20, buyed: false, skinImage: "marker4.png", skinPreview: "marker4p.png"),
        LSMarkerBuyButton(curency: .moneys, price: 20, buyed: false, skinImage: "marker5.png", skinPreview: "marker5p.png"),
        LSMarkerBuyButton(curency: .moneys, price: 40, buyed: false, skinImage: "marker6.png", skinPreview: "marker6p.png"),
        LSMarkerBuyButton(curency: .moneys, price: 40, buyed: false, skinImage: "marker7.png", skinPreview: "marker7p.png"),
        LSMarkerBuyButton(curency: .moneys, price: 40, buyed: false, skinImage: "marker8.png", skinPreview: "marker8p.png"),
        LSMarkerBuyButton(curency: .gems, price: 2, buyed: false, skinImage: "bitcoin.png", skinPreview: "bitcoinP.png"),
        LSMarkerBuyButton(curency: .gems, price: 4, buyed: false, skinImage: "horseshoe.png", skinPreview: "horseshoeP.png"),
        LSMarkerBuyButton(curency: .gems, price: 4, buyed: false, skinImage: "web.png", skinPreview: "webP.png"),
        LSMarkerBuyButton(curency: .gems, price: 8, buyed: false, skinImage: "marker13.png", skinPreview: "marker13p.png"),
        LSMarkerBuyButton(curency: .gems, price: 8, buyed: false, skinImage: "marker14.png", skinPreview: "marker14p.png"),
        LSMarkerBuyButton(curency: .gems, price: 12, buyed: false, skinImage: "marker15.png", skinPreview: "marker15p.png")
    ]
    
    init() {
        let save = UserDefaults.standard
        var i = 0
        for btn in markers {
            btn.x = Double(Int(i % 3)*(142+20))+92
            btn.y = Double(Int(i / 3)*(142+20))+285
            i += 1
            if !btn.buyed {
                btn.buyed = save.bool(forKey: btn.skinShopPreview+"Buyed")
            }
        }
    }
    
    func updateView(frame f: HEGameFrame, mf: HEGameFrame, v: ViewController) {
        //end scroll
        if endSpeed > 3 {
            movY += endSpeed
            endSpeed -= 4
        } else if endSpeed < -3 {
            movY += endSpeed
            endSpeed += 4
        } else {
            endSpeed = 0
        }
        if movY > 0 {
            movY -= movY/4
            if endSpeed > 5 {
                movY += endSpeed
                endSpeed -= 8
            } else if endSpeed < -5 {
                movY += endSpeed
                endSpeed += 8
            } else {
                endSpeed = 0
            }
        }
        if movY < minY {
            movY += (minY - movY) / 4
            if endSpeed > 5 {
                movY += endSpeed
                endSpeed -= 8
            } else if endSpeed < -5 {
                movY += endSpeed
                endSpeed += 8
            } else {
                endSpeed = 0
            }
        }
        
        mf.addImageToView(img: LSLanguage().mLangs[LSLanguage.lang][10], xpos: 0, ypos: 0, w: 640, h: 1136)
        mf.addImageToViewWithAlpha(img: "moneyscounter.png", xpos: 70, ypos: 134+40, w: 497, h: 67, alpha: 1)
        mf.addTextToView(x: -38, y: 166+40, width: 800, height: 214, align: .right, font: "Lato-Light", size: 40, color: .black, text: "\(v.save.integer(forKey: "dmoney"))")
        mf.addTextToView(x: 150, y: 166+40, width: 800, height: 214, align: .right, font: "Lato-Light", size: 40, color: .black, text: "\(v.save.integer(forKey: "dgems"))")
        
        var suffix = ""
        
        if LSLanguage.lang == 1 {
            suffix = "_ru"
        } else {
            suffix = ""
        }
        
        //v.middleGameView.addImageToView(img: "endlessbuy\(suffix).png", xpos: 100, ypos: 285+movY, w: 454, h: 259)
        //v.middleGameView.addImageToView(img: "restore\(suffix).png", xpos: 100, ypos: 285+285+movY, w: 454, h: 75)
        v.middleGameView.addImageToView(img: "mshop\(suffix).png", xpos: 100, ypos: 285+movY, w: 454, h: 58)
        for btn in markers {
            btn.updateView(frame: v.middleGameView, v: v, movY: movY+60)
        }
    }
    func compareTouch(p: HEPoint, v: ViewController) {
        if p.x > 78 && p.x < 78+101 && p.y > 75 && p.y < 75 + 94 {
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
        }
        for btn in markers {
            btn.compareTouch(point: p, v: v, movY: movY)
        }
    }
    
    func startScroll(starttouch st: Double) {
        endSpeed = 0
        startPos = movY
        startTouch = st
        pEndSpeed = 0
    }
    
    func endScroll(endTouch: Double) {
        if scrolTic > 1 {
            endSpeed = pEndSpeed
        }
        scrolTic = 0
    }
    
    func scroll(currenttouch ct: Double) {
        if scrolTic > 1 {
            movY = startPos - (startTouch - ct)
            pEndSpeed = (currentTouch - ct) * -1.5
        }
        currentTouch = ct
        scrolTic += 1
    }
}

