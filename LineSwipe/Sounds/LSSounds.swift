//
//  LSSounds.swift
//  LineSwipe
//
//  Created by Daniil Belov on 15.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit
import AVFoundation

class LSSounds {
    var player = AVAudioPlayer()
    static var enable = false
    
    func close() {
        let save = UserDefaults.standard
        if save.bool(forKey: "settings.sound") {
            guard let url = Bundle.main.url(forResource: "close", withExtension: "mp3") else { return }
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
                
                
                
                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
                /* iOS 10 and earlier require the following line:
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
                
                
                
                player.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    func open() {
        let save = UserDefaults.standard
        if save.bool(forKey: "settings.sound") {
            guard let url = Bundle.main.url(forResource: "open", withExtension: "mp3") else { return }
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
                
                
                
                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
                /* iOS 10 and earlier require the following line:
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
                
                
                if LSSounds.enable {
                    player.play()
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    func swipe() {
        let save = UserDefaults.standard
        if save.bool(forKey: "settings.sound") {
            guard let url = Bundle.main.url(forResource: "Swipe", withExtension: "mp3") else { return }
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
                
                
                
                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
                /* iOS 10 and earlier require the following line:
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
                
                
                
                player.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
