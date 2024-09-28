//
//  ViewController.swift
//  LineSwipe
//
//  Created by Daniil Belov on 09.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit
import GameKit

import GoogleMobileAds


import AudioToolbox.AudioServices

class ViewController: UIViewController, GKGameCenterControllerDelegate, GADInterstitialDelegate, GADRewardBasedVideoAdDelegate {
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    func openGC() {
        let vc = self.view.window?.rootViewController
        let gcvc = GKGameCenterViewController()
        
        gcvc.gameCenterDelegate = self
        
        vc?.present(gcvc, animated: true, completion: nil)
    }
    
    func saveCompanyStars(number: Int) {
        if GKLocalPlayer.localPlayer().isAuthenticated {
            let scoreReporter = GKScore(leaderboardIdentifier: "SLCompanyStars")
            scoreReporter.value = Int64(number)
            let scoreArray: [GKScore] = [scoreReporter]
            GKScore.report(scoreArray, withCompletionHandler: nil)
        }
    }
    func saveGenerateStars(number: Int) {
        if GKLocalPlayer.localPlayer().isAuthenticated {
            let scoreReporter = GKScore(leaderboardIdentifier: "SLGenerateStars")
            scoreReporter.value = Int64(number)
            let scoreArray: [GKScore] = [scoreReporter]
            GKScore.report(scoreArray, withCompletionHandler: nil)
        }
    }
    
    func autchPlayer() {
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {
            (view, error) in
            
            if view != nil {
                self.present(view!, animated: true, completion: nil)
            } else {
                print(GKLocalPlayer.localPlayer().isAuthenticated)
            }
        }
    }
    let request = GADRequest()
    var interstitial: GADInterstitial!
    
    let date = Date()
    let calendar = Calendar.current
    var day = 0
    var month = 0
    var hour = 0
    var minutes = 0
    
    var twin = LSWinBanner()
    
    var gameView = HEGameFrame()
    var middleGameView = HEGameFrame()
    var hightGameView = HEGameFrame()
    var megaGameView = HEGameFrame()
    var topGameView = HEGameFrame()
    
    var sounds = LSSounds()
    
    var wn = LSWhatsNew()
    
    var lvl = LSLevel(size: 4)
    var relvl = LSLevel(size: 4)
    
    var line = 0
    var column = 0
    
    var startTouch = false
    
    var touchPoint = HEPoint()
    
    var endTouchPoint = HEPoint()
    
    
    var currentPack = LSLevelPack()
    
    var gameState = -1
    
    var startMenu = LSStartScreen()
    
    var bgAnim = LSBackgroundAnimation()
    
    var ticTop = 0
    
    let save = UserDefaults.standard
    
    var st = 0
    
    var std = true
    
    var etic = 60
    
    @IBOutlet weak var mainView: UIView!
    
    let langPage = LSLanguageSelectPage()
    
    let energyBanner = LSEnergyBanner()
    
    let vkBanner = CHAdBaneer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        
        request.testDevices = [kGADSimulatorID]
        
        interstitial = createAndLoadInterstitial()
        
        let save = UserDefaults.standard
        LSLanguage.lang = save.integer(forKey: "settings.lang")
        
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        GADRewardBasedVideoAd.sharedInstance().load(request, withAdUnitID: "ca-app-pub-1132752396546515/3287611737")
        
        day = calendar.component(.day, from: date)
        month = calendar.component(.month, from: date)
        hour = calendar.component(.hour, from: date)
        minutes = calendar.component(.minute, from: date)
        
        
        lvl.setColor(color: 4, top: 0, left: 0)
        lvl.setColor(color: 5, top: 0, left: 1)
        lvl.setColor(color: 2, top: 1, left: 1)
        lvl.setColor(color: 3, top: 1, left: 2)
        lvl.setColor(color: 4, top: 2, left: 0)
        lvl.setColor(color: 3, top: 2, left: 1)
        lvl.setColor(color: 2, top: 2, left: 2)
        lvl.setColor(color: 5, top: 3, left: 2)
        lvl.setColor(color: 4, top: 3, left: 3)
        lvl.setColor(color: 4, top: 1, left: 3)
        
        lvl.setWinColor(color: 3, top: 0, left: 0)
        lvl.setWinColor(color: 4, top: 2, left: 0)
        lvl.setWinColor(color: 5, top: 3, left: 0)
        lvl.setWinColor(color: 2, top: 2, left: 1)
        lvl.setWinColor(color: 4, top: 3, left: 1)
        lvl.setWinColor(color: 2, top: 1, left: 2)
        lvl.setWinColor(color: 4, top: 0, left: 2)
        lvl.setWinColor(color: 5, top: 0, left: 3)
        lvl.setWinColor(color: 4, top: 1, left: 3)
        lvl.setWinColor(color: 3, top: 3, left: 3)
        
        lvl.viewY = 4500
        
        updateScreen() //start upfate screen
        scaleView()
        minUpdate()
        print("Friendship is Magic")
        
        
        lvl.viewYTarget = 950
        lvl.lvlTurn = true
        
        currentPack.pages[0].levelLoad(level: lvl, levelnum: 0, v: self)
        lvl.lvlPlay = false
        lvl.lvlTurn = true
        autchPlayer()
        
        if day - save.integer(forKey: "dcDay") == 1 && month == save.integer(forKey: "dcMonth")  {
            if day != save.integer(forKey: "dcDayVisit") {
                save.set(save.integer(forKey: "dcDayCount")+1, forKey: "dcDayCount")
                save.set(day, forKey: "dcDayVisit")
            }
        }
        if day - save.integer(forKey: "dcDay") > 1 {
            save.set(0, forKey: "dcDayCount")
        }
        
        //update energy
        if day != save.integer(forKey: "eDay") || month != save.integer(forKey: "eMonth") {
            save.set(8, forKey: "energy")
        } else {
            if (hour - save.integer(forKey: "eHour")) > 2 || (hour - save.integer(forKey: "eHour")) < 0 {
                save.set(8, forKey: "energy")
            } else if save.integer(forKey: "eMin") > 40 && minutes < 40 {
                save.set(save.integer(forKey: "energy")+1+minutes%15, forKey: "energy")
            } else {
                save.set(save.integer(forKey: "energy")+((minutes-save.integer(forKey: "eMin"))%15), forKey: "energy")
            }
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //update screen
    func updateScreen() {
        save.set(gameState, forKey: "savedGameState")
        //quick
        if startMenu.slAlpha <= 0 {
            if LSStart.startType == 1 {
                if startMenu.menuState == 6 {
                    startMenu.selectMode(point: touchPoint, view: self)
                } else {
                    gameState = 1
                    lvl.lvlTurn = false
                }
                LSStart.startType = 0
            }
            if LSStart.startType == 2 {
                let packs = LSLevelPacks()
                gameState = 1
                lvl.lvlTurn = true
                currentPack = packs.pack2
                LSStart.startType = 0
            }
            if LSStart.startType == 3 {
                let packs = LSLevelPacks()
                gameState = 1
                lvl.lvlTurn = true
                currentPack = packs.pack1
                LSStart.startType = 0
            }
            if LSStart.startType == 4 {
                gameState = 0
                startMenu.menuState = 4
                LSStart.startType = 0
            }
        }
        
        //ads and banners
        if save.integer(forKey: "countToBanner") >= 4 && lvl.lvlTurn && !save.bool(forKey: "vkShowed") {
            gameState = 5
            save.set(0, forKey: "countToBanner")
        }
        if save.integer(forKey: "startLevelCount") >= 12 {
            startInterstitial()
            save.set(0, forKey: "startLevelCount")
        }
        
        if save.integer(forKey: "mBtnClick") >= 2 {
            startInterstitial()
            save.set(0, forKey: "mBtnClick")
        }
        
        if save.integer(forKey: "mRR") == 6 {
            AppDelegate().requistReview()
            save.set(40, forKey: "mRR")
        }
        if save.integer(forKey: "mRR") >= 50 {
            save.set(40, forKey: "mRR")
        }
        
        
        //remove
        gameView.removeImages(frame: view)
        middleGameView.removeImages(frame: mainView)
        hightGameView.removeImages(frame: mainView)
        megaGameView.removeImages(frame: mainView)
        topGameView.removeImages(frame: mainView)
        
        
        
        //add image
        if ticTop < 2 {
            if !lvl.mix {
                ticTop = 30
                std = false
                let ll = lvl
                let l = relvl
                //l = LSLevel(size: ll.size)
                l.mix = ll.mix
                l.mix_count = ll.mix_count
                l.mix_r_or_c = ll.mix_r_or_c
                l.mix_direction = ll.mix_direction
                l.mix_num = ll.mix_num
                l.mixing_a = ll.mixing_a
                
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
            }
        }
        if ticTop > 1 && ticTop < 20 {
            ticTop -= 1
        }
        
        if gameState == 5 {
            vkBanner.updateView(f: megaGameView)
        }
        
        gameView.addImageToView(img: "menubg.png", xpos: 0, ypos: 0, w: 640, h: 1136)
        if gameState == 1 {
            if lvl.viewY > 2 {
                currentPack.updateView(frame: gameView, mf: middleGameView, hf: hightGameView, view: self, bg: bgAnim)
            }
            lvl.updateView(frame: hightGameView, mf: megaGameView, v: self)
            bgAnim.updateView(frame: topGameView)
        }
        if gameState == 0 {
            startMenu.updateScreen(frame: gameView, v: self, mf: topGameView)
            startMenu.updateStart(view: self)
        }
        if gameState == 8 {
            let save = UserDefaults.standard
            if save.bool(forKey: "wnv02b12") {
                gameState = 0
            }
            wn.updateScreen(frame: gameView)
        }
        if gameState == -1 {
            langPage.updateView(frame: gameView, v: self)
        }
        topGameView.addImageToView(img: "angle.png", xpos: 0, ypos: 0, w: 640, h: 1136)
        
        energyBanner.updateView(frame: topGameView, v: self)
        
        
        //twin.updateView(frame: gameView)
        
        //view
        gameView.viewImages(frame: mainView)
        middleGameView.viewImages(frame: mainView)
        hightGameView.viewImages(frame: mainView)
        megaGameView.viewImages(frame: mainView)
        topGameView.viewImages(frame: mainView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
            self.updateScreen()
        })
    }
    
    func scaleView() {
        mainView.bounds.size = CGSize(width: view.bounds.width, height: view.bounds.width*1.778)
        if mainView.bounds.height > view.bounds.height + 5 {
            mainView.bounds.size = CGSize(width: view.bounds.height * 0.562218, height: view.bounds.height)
        }
        gameView.scale = Double(mainView.bounds.width * 0.001565)
        middleGameView.scale = Double(mainView.bounds.width * 0.001565)
        hightGameView.scale = Double(mainView.bounds.width * 0.001565)
        topGameView.scale = Double(mainView.bounds.width * 0.001565)
        megaGameView.scale = Double(mainView.bounds.width * 0.001565)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.scaleView()
        })
    }
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func minUpdate() {
        //save relvl
        if !lvl.lvlTurn {
            save.set(relvl.size, forKey: "re"+lvl.uID+"savedSize")
            save.set(relvl.bg, forKey: "re"+lvl.uID+"savedBG")
            save.set(relvl.colors, forKey: "re"+lvl.uID+"savedColors")
            save.set(relvl.winColors, forKey: "re"+lvl.uID+"savedWinColors")
            save.set(relvl.complete, forKey: "re"+lvl.uID+"savedComplete")
            save.set(relvl.sec, forKey: "re"+lvl.uID+"savedSec")
            save.set(relvl.timeMode, forKey: "re"+lvl.uID+"savedTimeMode")
            save.set(relvl.scale, forKey: "re"+lvl.uID+"savedScale")
            save.set(relvl.winTic, forKey: "re"+lvl.uID+"savedWinTic")
            save.set(relvl.lvlIcon, forKey: "re"+lvl.uID+"savedLvlIcon")
            save.set(relvl.lvlID, forKey: "re"+lvl.uID+"savedLvlID")
            save.set(relvl.gameovertype, forKey: "re"+lvl.uID+"savedGameOverType")
            save.set(relvl.notcomplete, forKey: lvl.uID+"savedNotComplete")
            save.set(relvl.uID, forKey: "re"+lvl.uID+"savedUID")
            save.set(relvl.winType, forKey: "re"+lvl.uID+"savedWinType")
            save.set(relvl.starcounter_value, forKey: "re"+lvl.uID+"savedStarcounter_value")
            save.set(relvl.starcounter_speed, forKey: "re"+lvl.uID+"savedStarcounter_speed")
            save.set(relvl.helpState, forKey: "re"+lvl.uID+"savedHelpState")
            save.set(relvl.steps, forKey: "re"+lvl.uID+"savedSteps")
            save.set(relvl.lvlTurn, forKey: "re"+lvl.uID+"savedLvlTurn")
        }
        etic -= 1
        if etic <= 0 {
            save.set(save.integer(forKey: "energy")+1, forKey: "energy")
            etic = 60
        }
        if save.integer(forKey: "energy") >= 8 {
            save.set(8,forKey: "energy")
            etic = 60
        }
        
        day = calendar.component(.day, from: date)
        month = calendar.component(.month, from: date)
        hour = calendar.component(.hour, from: date)
        minutes = calendar.component(.minute, from: date)
        save.set(day, forKey: "eDay")
        save.set(hour, forKey: "eHour")
        save.set(minutes, forKey: "eMin")
        save.set(month, forKey: "eMonth")
        
        //save to leadboard
        if lvl.saveSt {
            saveCompanyStars(number: save.integer(forKey: "stars"))
            saveGenerateStars(number: save.integer(forKey: "gstars"))
            lvl.saveSt = false
        }
        if lvl.uID == "dclvl" {
            if lvl.complete && !lvl.notcomplete {
                if currentPack.packState == 3 {
                    touchPoint.x = 0
                    currentPack.startBack(point: touchPoint, view: self)
                    save.set(day, forKey: "dcDay")
                    save.set(month, forKey: "dcMonth")
                }
            }
        }
        
        lvl.updateTime()
        if gameState == 0 {
            if startMenu.menuState == 7 {
                startMenu.tutorial.secUpdate()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.00, execute: {
            self.minUpdate()
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            touchPoint.x = Double(touch.location(in: mainView).x) / gameView.scale
            touchPoint.y = Double(touch.location(in: mainView).y) / gameView.scale
            if gameState == -1 {
                langPage.compareTouch(point: touchPoint, v: self)
            }
            if gameState == 1 {
                line = lvl.compareLine(point: touchPoint)
                column = lvl.compareСolumn(point: touchPoint)
                if lvl.lvlTurn {
                    if touchPoint.y < 928 && touchPoint.y > 180 {
                        currentPack.startScroll(starttouch: Double(touch.location(in: mainView).y) / gameView.scale)
                    }
                }
            }
            if gameState == 5 {
                vkBanner.compareTouch(p: touchPoint, v: self)
            }
            if gameState == 0 {
                if startMenu.menuState == 15 {
                    startMenu.shopPage.startScroll(starttouch: Double(touch.location(in: mainView).y) / gameView.scale)
                }
            }
            startTouch = true
            
            let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
            notificationFeedbackGenerator.notificationOccurred(.success)
            print("touch")
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            endTouchPoint.x = Double(touch.location(in: mainView).x) / gameView.scale
            endTouchPoint.y = Double(touch.location(in: mainView).y) / gameView.scale
            if !energyBanner.view {
                if gameState == 1 {
                    if currentPack.packState == 0 {
                        if touchPoint.x == endTouchPoint.x && touchPoint.y == endTouchPoint.y {
                            currentPack.compareTouch(point: touchPoint, level: lvl, v: self)
                            currentPack.updateBack(view: self, bg: bgAnim)
                        }
                    } else {
                        currentPack.compareTouch(point: touchPoint, level: lvl, v: self)
                        currentPack.updateBack(view: self, bg: bgAnim)
                    }
                    lvl.compareTouch(point: touchPoint, view: self)
                    if lvl.lvlTurn {
                        if touchPoint.y < 928 && touchPoint.y > 180 {
                            currentPack.endScroll(endTouch: Double(touch.location(in: mainView).y) / gameView.scale)
                        }
                    }
                }
                
                if gameState == 0 {
                    if endTouchPoint.y == touchPoint.y {
                        startMenu.selectMode(point: touchPoint, view: self)
                    } else if startMenu.menuState != 15 {
                        startMenu.selectMode(point: touchPoint, view: self)
                    }
                    if startMenu.menuState == 15 {
                        startMenu.shopPage.endScroll(endTouch: Double(touch.location(in: mainView).y) / gameView.scale)
                    }
                    //startMenu.startGame(view: self)
                }
                if gameState == 8 {
                    let save = UserDefaults.standard
                    wn.nextPage()
                    if wn.page > 2 {
                        save.set(true, forKey: "wnv02b12")
                    }
                }
            } else {
                energyBanner.compareTouch(point: touchPoint, view: self)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if gameState == 1 {
                if lvl.lvlTurn {
                    if touchPoint.y < 928 && touchPoint.y > 180 {
                        currentPack.scroll(currenttouch: Double(touch.location(in: mainView).y) / gameView.scale)
                    }
                }
            } else if gameState == 0 {
                if startMenu.menuState == 15 {
                    startMenu.shopPage.scroll(currenttouch: Double(touch.location(in: mainView).y) / gameView.scale)
                }
            }
        }
    }
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        if gameState == 1 {
            if line != -1 && lvl.lvlPlay {
                lvl.moveLeft(top: line)
            } else {
                if lvl.lvlTurn {
                    currentPack.nextPage()
                }
            }
            currentPack.startBack(point: touchPoint, view: self)
        } else if gameState == 0 {
            startMenu.leftSwipe(view: self)
            if startMenu.menuState == 7 {
                startMenu.tutorial.leftSwipe(point: touchPoint)
            }
        }
    }
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        if gameState == 1 {
            if line != -1 && lvl.lvlPlay {
                lvl.moveRight(top: line)
            } else {
                if lvl.lvlTurn {
                    currentPack.previousPage()
                }
            }
            currentPack.startBack(point: touchPoint, view: self)
        } else if gameState == 0 {
            startMenu.rightSwipe()
        }
    }
    
    @IBAction func upSwipe(_ sender: UISwipeGestureRecognizer) {
        if gameState == 1 {
            if column != -1 && lvl.lvlPlay {
                lvl.moveUp(left: column)
            } else {
                if touchPoint.y > 928 {
                    lvl.lvlTurn = false;
                    lvl.lvlPlay = true;
                    sounds.open()
                }
            }
        }
    }
    
    @IBAction func downSwipe(_ sender: UISwipeGestureRecognizer) {
        if gameState == 1 {
            if column != -1 && lvl.lvlPlay {
                lvl.moveDown(left: column)
            } else  {
                if !lvl.lvlTurn {
                    if touchPoint.y < 180 {
                        lvl.lvlTurn = true;
                        lvl.lvlPlay = false;
                        sounds.close()
                    }
                }
            }
        } else if gameState == 0 {
            if startMenu.menuState == 7 {
                startMenu.tutorial.downSwipe(point: touchPoint)
            }
        }
        
        //Appodeal.showAd(AppodealShowStyle.rewardedVideo, rootViewController: self)
    }
    
    func restartLevel() {
        let l = self.lvl
        let ll = self.relvl
        l.mix = ll.mix
        l.mix_count = ll.mix_count
        l.mix_r_or_c = ll.mix_r_or_c
        l.mix_direction = ll.mix_direction
        l.mix_num = ll.mix_num
        l.mixing_a = ll.mixing_a
        
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
        l.isStart = true
        //l.start_mix()
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if gameState == 1 {
                if !lvl.lvlTurn && lvl.uID != "dclvl" {
                    lvl.restartPanel.viewPanel()
                }
            }
        }
    }
    
    
    //ads
    func createAndLoadInterstitial() -> GADInterstitial {
        let i = GADInterstitial(adUnitID: "ca-app-pub-1132752396546515/6607500526")
        i.delegate = self
        i.load(request)
        return i
    }
    
    
    func startRewardVideo() {
        GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
    }
    
    func startInterstitial() {
        //ad
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that an interstitial will be presented.
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        print("interstitialWillPresentScreen")
    }
    
    /// Tells the delegate the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        print("interstitialWillDismissScreen")
    }
    
    /// Tells the delegate the interstitial had been animated off the screen.
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitialDidDismissScreen")
        interstitial = createAndLoadInterstitial()
    }
    
    /// Tells the delegate that a user click will open another app
    /// (such as the App Store), backgrounding the current app.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        print("interstitialWillLeaveApplication")
    }
    
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
        save.set(8, forKey: "energy")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad has completed.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
        GADRewardBasedVideoAd.sharedInstance().load(request, withAdUnitID: "ca-app-pub-1132752396546515/3287611737")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
    }
    
    
    
    func rewardedVideoDidLoadAd(){
        NSLog("видео реклама была загружена")
    }
    func rewardedVideoDidFailToLoadAd(){
        NSLog("видео рекламе не удалось загрузиться")
    }
    func rewardedVideoDidPresent(){
        NSLog("видео реклама начала отображаться");
    }
    func rewardedVideoWillDismiss(){
        NSLog("видео реклама была закрыта");
    }
    func rewardedVideoDidFinish(){
        NSLog("видео было полностью просмотрено");
        save.set(8, forKey: "energy")
        if LSStart.rewardType == 1 {
            save.set(8, forKey: "energy")
            LSStart.rewardType = 0
            NSLog("Энергия получена")
        }
    }
    
}

