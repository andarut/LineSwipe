//
//  LSLevelGenerator.swift
//  LineSwipe
//
//  Created by Daniil Belov on 17.05.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSLevelGenerator {
    var c = 3
    func generate4x4() -> [[Int]] {
        var colors = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
        for i in 0...3 {
            colors[0][i] = Int(arc4random_uniform(UInt32(c)))+1
            colors[1][i] = Int(arc4random_uniform(UInt32(c)))+1
        }
        var num = 3
        for i in 0...3 {
            colors[3][num] = colors[0][i]
            colors[2][num] = colors[1][i]
            num -= 1
        }
        return colors
    }
    
    func generate5x5() -> [[Int]] {
        var colors = [[0,0,0,0,0], [0,0,0,0,0], [0,0,0,0,0], [0,0,0,0,0], [0,0,0,0,0]]
        for i in 0...4 {
            colors[0][i] = Int(arc4random_uniform(UInt32(c)))+1
            colors[1][i] = Int(arc4random_uniform(UInt32(c)))+1
        }
        var num = 4
        for i in 0...4 {
            colors[4][num] = colors[0][i]
            colors[3][num] = colors[1][i]
            num -= 1
        }
        colors[2][0] = Int(arc4random_uniform(UInt32(c)))+1
        colors[2][1] = Int(arc4random_uniform(UInt32(c)))+1
        colors[2][2] = Int(arc4random_uniform(UInt32(c)))+1
        colors[2][3] = colors[2][1]
        colors[2][4] = colors[2][0]
        return colors
    }
    
    func generate6x6() -> [[Int]] {
        var colors = [[0,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0]]
        for i in 0...5 {
            colors[0][i] = Int(arc4random_uniform(UInt32(c)))+1
            colors[1][i] = Int(arc4random_uniform(UInt32(c)))+1
            colors[2][i] = Int(arc4random_uniform(UInt32(c)))+1
        }
        var num = 5
        for i in 0...5 {
            colors[5][i] = colors[0][num]
            colors[4][i] = colors[1][num]
            colors[3][i] = colors[2][num]
            num -= 1
        }
        return colors
    }
    
    func generate7x7() -> [[Int]] {
        var colors = [[0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0]]
        for i in 0...6 {
            colors[0][i] = Int(arc4random_uniform(7))+1
            colors[1][i] = Int(arc4random_uniform(7))+1
            colors[2][i] = Int(arc4random_uniform(7))+1
        }
        var num = 6
        for i in 0...6 {
            colors[6][num] = colors[0][i]
            colors[5][num] = colors[1][i]
            colors[4][num] = colors[2][i]
            num -= 1
        }
        colors[3][0] = Int(arc4random_uniform(7))+1
        colors[3][1] = Int(arc4random_uniform(7))+1
        colors[3][2] = Int(arc4random_uniform(7))+1
        colors[3][3] = Int(arc4random_uniform(7))+1
        
        colors[3][6] = colors[3][0]
        colors[3][5] = colors[3][1]
        colors[3][4] = colors[3][2]
        return colors
    }
}
