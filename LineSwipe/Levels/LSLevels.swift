//
//  LSLevels.swift
//  LineSwipe
//
//  Created by Daniil Belov on 12.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSLevels {
    var empty = LSLevel(size: 4)
    
    var lvl1 = LSLevel(size: 4)
    var lvl0_1 = LSLevel(size: 3)
    var lvl0_2 = LSLevel(size: 3)
    var lvl0_3 = LSLevel(size: 3)
    var lvl0_4 = LSLevel(size: 3)
    var lvl0_5 = LSLevel(size: 4)
    var lvl0_6 = LSLevel(size: 4)
    var lvl0_7 = LSLevel(size: 4)
    var lvl0_8 = LSLevel(size: 4)
    var lvl0_9 = LSLevel(size: 4)
    var lvl0_10 = LSLevel(size: 4)
    var lvl0_11 = LSLevel(size: 3)
    var lvl0_12 = LSLevel(size: 3)
    var lvl0_13 = LSLevel(size: 4)
    var lvl0_14 = LSLevel(size: 4)
    var lvl0_15 = LSLevel(size: 4)
    var lvl0_16 = LSLevel(size: 3)
    var lvl0_17 = LSLevel(size: 4)
    var lvl0_18 = LSLevel(size: 4)
    var lvl0_19 = LSLevel(size: 5)
    var lvl0_20 = LSLevel(size: 5)
    var lvl0_21 = LSLevel(size: 4)
    var lvl0_22 = LSLevel(size: 5)
    var lvl0_23 = LSLevel(size: 5)
    var lvl0_24 = LSLevel(size: 5)
    var lvl0_25 = LSLevel(size: 5)
    var lvl0_26 = LSLevel(size: 4)
    var lvl0_27 = LSLevel(size: 5)
    var lvl0_28 = LSLevel(size: 5)
    var lvl0_29 = LSLevel(size: 6)
    var lvl0_30 = LSLevel(size: 6)
    
    
    var lvl1_1 = LSLevel(size: 3)
    var lvl1_2 = LSLevel(size: 3)
    var lvl1_3 = LSLevel(size: 3)
    var lvl1_4 = LSLevel(size: 3)
    var lvl1_5 = LSLevel(size: 4)
    var lvl1_6 = LSLevel(size: 4)
    var lvl1_7 = LSLevel(size: 4)
    var lvl1_8 = LSLevel(size: 4)
    var lvl1_9 = LSLevel(size: 4)
    var lvl1_10 = LSLevel(size: 4)
    var lvl1_11 = LSLevel(size: 3)
    var lvl1_12 = LSLevel(size: 4)
    var lvl1_13 = LSLevel(size: 4)
    var lvl1_14 = LSLevel(size: 5)
    var lvl1_15 = LSLevel(size: 5)
    var lvl1_16 = LSLevel(size: 4)
    var lvl1_17 = LSLevel(size: 5)
    var lvl1_18 = LSLevel(size: 5)
    var lvl1_19 = LSLevel(size: 5)
    var lvl1_20 = LSLevel(size: 6)
    var lvl1_21 = LSLevel(size: 5)
    var lvl1_22 = LSLevel(size: 5)
    var lvl1_23 = LSLevel(size: 5)
    var lvl1_24 = LSLevel(size: 5)
    var lvl1_25 = LSLevel(size: 5)
    var lvl1_26 = LSLevel(size: 4)
    var lvl1_27 = LSLevel(size: 5)
    var lvl1_28 = LSLevel(size: 5)
    var lvl1_29 = LSLevel(size: 6)
    var lvl1_30 = LSLevel(size: 6)
    
    init() {
        //empty
        empty.lvlIcon = "lvlEmpty.png"
        empty.lvlID = 0
        
        
        //lvl 0 1
        lvl0_1.winColors = [[0,0,0],[2,2,2],[0,0,0]]
        lvl0_1.colors = [[0,2,0],[2,0,2],[0,0,0]]
        lvl0_1.lvlIcon = "lvl0-1.png"
        lvl0_1.scale = 1.335
        lvl0_1.uID = "m0l1"
        lvl0_1.steps = 3
        lvl0_1.starcounter_speed = 163
        
        //lvl 0 2
        lvl0_2.winColors = [[2,0,0],[2,2,2],[0,0,2]]
        lvl0_2.colors = [[0,0,2],[2,2,2],[2,0,0]]
        lvl0_2.lvlIcon = "lvl0-2.png"
        lvl0_2.scale = 1.36
        lvl0_2.lvlID = 2
        lvl0_2.uID = "m0l2"
        lvl0_2.steps = 6
        lvl0_2.starcounter_speed = 40
        
        //lvl 0 3
        lvl0_3.winColors = [[2,0,0],[2,0,2],[0,0,2]]
        lvl0_3.colors = [[0,0,2],[0,2,2],[2,0,0]]
        lvl0_3.lvlIcon = "lvl0-3.png"
        lvl0_3.scale = 1.36
        lvl0_3.lvlID = 3
        lvl0_3.uID = "m0l3"
        lvl0_3.steps = 9
        lvl0_3.starcounter_speed = 40
        
        //lvl 0 4
        lvl0_4.winColors = [[0,2,0],[2,0,2],[2,2,2]]
        lvl0_4.colors = [[0,0,0],[2,2,2],[2,2,2]]
        lvl0_4.lvlIcon = "lvl0-4.png"
        lvl0_4.lvlID = 4
        lvl0_4.uID = "m0l4"
        lvl0_4.steps = 3
        lvl0_4.starcounter_speed = 19
        
        //lvl 0 5
        lvl0_5.winColors = [[2,2,2,2],[2,0,0,2],[2,0,0,2],[2,2,2,2]]
        lvl0_5.colors = [[2,0,0,2],[2,2,2,2],[2,2,2,2],[2,0,0,2]]
        lvl0_5.lvlIcon = "lvl0-5.png"
        lvl0_5.lvlID = 5
        lvl0_5.uID = "m0l5"
        lvl0_5.steps = 16
        lvl0_5.starcounter_speed = 11
        
        //lvl 0 6
        lvl0_6.winColors = [[5,4,4,4],[5,5,4,4],[4,4,5,5],[4,4,4,5]]
        lvl0_6.colors = [[4,4,4,4],[5,5,4,5],[5,4,5,5],[4,4,4,4]]
        lvl0_6.lvlIcon = "lvl0-6.png"
        lvl0_6.lvlID = 6
        lvl0_6.uID = "m0l6"
        lvl0_6.steps = 6
        
        //lvl 0 7
        lvl0_7.winColors = [[5,4,2,5],[5,4,4,4],[4,4,4,5],[5,2,4,5]]
        lvl0_7.colors = [[5,5,4,2],[5,4,4,4],[4,4,4,5],[2,4,5,5]]
        lvl0_7.lvlIcon = "lvl0-7.png"
        lvl0_7.lvlID = 7
        lvl0_7.uID = "m0l7"
        lvl0_7.steps = 6
        
        //lvl 0 8
        lvl0_8.winColors = [[4,4,2,4],[4,4,5,5],[5,5,4,4],[4,2,4,4]]
        lvl0_8.colors = [[4,5,4,4],[4,5,2,4],[4,2,5,4],[4,4,5,4]]
        lvl0_8.lvlIcon = "lvl0-8.png"
        lvl0_8.lvlID = 8
        lvl0_8.uID = "m0l8"
        lvl0_8.steps = 16
        
        //lvl 0 9
        lvl0_9.winColors = [[4,2,2,5],[4,4,4,5],[5,4,4,4],[5,2,2,4]]
        lvl0_9.colors = [[4,2,2,4],[4,4,5,5],[5,5,4,4],[4,2,2,4]]
        lvl0_9.lvlIcon = "lvl0-9.png"
        lvl0_9.lvlID = 9
        lvl0_9.uID = "m0l9"
        lvl0_9.steps = 16
        
        //lvl 0 10
        lvl0_10.winColors = [[4,5,4,4],[5,2,4,4],[4,4,2,5],[4,4,5,4]]
        lvl0_10.colors = [[4,5,4,4],[2,4,5,4],[4,5,4,2],[4,4,5,4]]
        lvl0_10.lvlID = 10
        lvl0_10.uID = "m0l10"
        lvl0_10.steps = 18
        
        
        //lvl 0 11
        lvl0_11.colors = [[7,0,7],[0,3,0],[7,0,7]]
        lvl0_11.winColors = [[0,7,0],[7,3,7],[0,7,0]]
        lvl0_11.lvlIcon = "lvl0-11.png"
        lvl0_11.lvlID = 11
        lvl0_11.uID = "m0l11"
        lvl0_11.steps = 12
        
        
        //lvl 0 12
        lvl0_12.colors = [[0,3,0],[7,7,7],[7,3,3]]
        lvl0_12.winColors = [[3,0,7],[7,3,7],[7,0,3]]
        lvl0_12.lvlIcon = "lvl0-12.png"
        lvl0_12.lvlID = 12
        lvl0_12.uID = "m0l12"
        lvl0_12.steps = 9
        
        
        //lvl 0 13
        lvl0_13.colors = [[0,0,3,0],[7,7,0,3],[0,3,7,7],[0,3,0,0]]
        lvl0_13.winColors = [[0,0,3,0],[7,7,3,0],[0,3,7,7],[0,3,0,0]]
        lvl0_13.lvlIcon = "lvl0-13.png"
        lvl0_13.lvlID = 13
        lvl0_13.uID = "m0l13"
        lvl0_13.steps = 12
        
        
        //lvl 0 14
        lvl0_14.colors = [[3,7,3,3],[7,0,0,0],[0,0,0,7],[3,3,7,3]]
        lvl0_14.winColors = [[7,0,3,3],[7,0,3,0],[0,3,0,7],[3,3,0,7]]
        lvl0_14.lvlIcon = "lvl0-14.png"
        lvl0_14.lvlID = 14
        lvl0_14.uID = "m0l14"
        lvl0_14.steps = 21
        
        
        //lvl 0 15
        lvl0_15.colors = [[3,0,0,0],[3,0,3,3],[7,7,0,7],[0,0,0,7]]
        lvl0_15.winColors = [[0,3,7,0],[3,0,0,3],[7,0,0,7],[0,3,7,0]]
        lvl0_15.lvlIcon = "lvl0-15.png"
        lvl0_15.lvlID = 15
        lvl0_15.uID = "m0l15"
        lvl0_15.steps = 21
        
        
        //lvl 0 16
        lvl0_16.colors = [[5,0,6],[7,6,5],[6,7,5]]
        lvl0_16.winColors = [[5,7,5],[5,0,6],[6,7,6]]
        lvl0_16.lvlIcon = "lvl0-16.png"
        lvl0_16.lvlID = 16
        lvl0_16.uID = "m0l16"
        lvl0_16.steps = 12
        
        
        //lvl 0 17
        lvl0_17.colors = [[6,7,0,0],[0,6,7,7],[5,0,5,5],[0,6,0,0]]
        lvl0_17.winColors = [[6,6,0,0],[6,7,7,0],[0,7,5,5],[0,0,5,0]]
        lvl0_17.lvlIcon = "lvl0-17.png"
        lvl0_17.lvlID = 17
        lvl0_17.uID = "m0l17"
        lvl0_17.steps = 18
        
        //lvl 0 18
        lvl0_18.colors = [[6,7,0,0],[6,6,0,5],[5,6,6,0],[0,7,0,6]]
        lvl0_18.winColors = [[6,6,6,0],[0,5,7,0],[0,5,7,0],[0,6,6,6]]
        lvl0_18.lvlIcon = "lvl0-18.png"
        lvl0_18.lvlID = 18
        lvl0_18.uID = "m0l18"
        lvl0_18.steps = 21
        
        
        //lvl 0 19
        lvl0_19.colors = [[0,0,5,0,0],[7,6,6,0,7],[7,0,7,0,0],[7,0,6,6,7],[5,0,0,0,0]]
        lvl0_19.winColors = [[0,0,0,5,0],[7,7,6,6,0],[0,7,0,7,0],[0,6,6,7,7],[0,5,0,0,0]]
        lvl0_19.lvlIcon = "lvl0-19.png"
        lvl0_19.lvlID = 19
        lvl0_19.uID = "m0l19"
        lvl0_19.starcounter_speed = 0.05
        lvl0_19.steps = 18
        
        //lvl 0 20
        lvl0_20.colors = [[7,6,0,0,0],[0,7,5,0,7],[0,6,0,7,0],[0,0,7,0,0],[0,0,0,0,7]]
        lvl0_20.winColors = [[7,0,0,0,0],[7,0,6,0,0],[0,7,5,7,0],[0,0,6,0,7],[0,0,0,0,7]]
        lvl0_20.lvlID = 20
        lvl0_20.lvlIcon = "lvl0-20.png"
        lvl0_20.uID = "m0l20"
        lvl0_20.starcounter_speed = 0.05
        lvl0_20.steps = 27
        
        //lvl 0 21
        lvl0_21.colors = [[8,7,8,8],[8,3,8,8],[3,8,7,7],[3,3,8,7]]
        lvl0_21.winColors = [[3,8,8,8],[3,3,3,8],[8,7,7,7],[8,8,8,7]]
        lvl0_21.lvlID = 21
        lvl0_21.lvlIcon = "lvl0-21.png"
        lvl0_21.uID = "m0l21"
        lvl0_21.steps = 21
        
        //lvl 0 22
        lvl0_22.colors = [[8,8,8,8,8],[7,7,8,3,3],[8,7,8,3,8],[7,8,8,8,8,3],[3,8,7,8,8]]
        lvl0_22.winColors = [[8,3,8,7,8],[8,8,8,8,8],[7,7,8,3,3],[8,7,8,3,8],[7,8,8,8,3]]
        lvl0_22.lvlID = 22
        lvl0_22.lvlIcon = "lvl0-22.png"
        lvl0_22.uID = "m0l22"
        lvl0_22.steps = 21
        
        //lvl 0 23
        lvl0_23.colors = [[3,3,8,8,8],[8,8,7,8,3],[7,8,3,7,3],[8,3,7,8,7],[8,8,3,7,7]]
        lvl0_23.winColors = [[3,3,3,8,8],[3,8,8,7,8],[3,7,8,3,7],[8,3,8,8,7],[8,8,7,7,7]]
        lvl0_23.lvlID = 23
        lvl0_23.lvlIcon = "lvl0-23.png"
        lvl0_23.uID = "m0l23"
        lvl0_23.steps = 21
        
        //lvl 0 24
        lvl0_24.colors = [[7,8,8,8,8],[8,3,7,3,8],[8,3,3,8,8],[8,8,3,7,7],[7,8,3,3,8]]
        lvl0_24.winColors = [[8,7,8,8,3],[8,3,7,8,8],[3,3,8,7,8],[8,8,3,3,7],[7,8,3,8,8]]
        lvl0_24.lvlID = 24
        lvl0_24.lvlIcon = "lvl0-24.png"
        lvl0_24.uID = "m0l24"
        lvl0_24.steps = 21
        
        //lvl 0 25
        lvl0_25.colors = [[8,3,3,7,8],[8,3,7,7,7],[8,8,8,3,7],[3,3,3,7,8],[8,3,7,7,8]]
        lvl0_25.winColors = [[8,3,3,7,7],[8,3,7,8,3],[8,3,8,7,8],[7,8,3,7,8],[3,3,7,7,8]]
        lvl0_25.lvlID = 25
        lvl0_25.lvlIcon = "lvl0-25.png"
        lvl0_25.uID = "m0l25"
        lvl0_25.steps = 21
        
        //lvl 0 26
        lvl0_26.colors = [[1,5,5,5],[1,1,5,1],[13,5,13,13],[5,5,5,13]]
        lvl0_26.winColors = [[5,1,5,5],[1,1,1,5],[5,13,13,13],[5,5,13,5]]
        lvl0_26.lvlID = 26
        lvl0_26.lvlIcon = "lvl0-26.png"
        lvl0_26.uID = "m0l26"
        lvl0_26.steps = 21
        
        //lvl 0 27
        lvl0_27.colors = [[1,13,13,1,5],[5,1,5,13,6],[5,13,1,1,5],[6,13,13,5,5],[5,5,1,1,13]]
        lvl0_27.winColors = [[5,1,5,1,1],[5,13,13,1,6],[5,1,5,13,5],[6,13,1,1,5],[13,13,5,13,5]]
        lvl0_27.lvlID = 27
        lvl0_27.lvlIcon = "lvl0-27.png"
        lvl0_27.uID = "m0l27"
        lvl0_27.steps = 21
        
        //lvl 0 28
        lvl0_28.colors = [[1,6,5,6,13],[13,6,1,6,5],[13,6,1,6,5],[5,6,13,6,1],[1,6,5,6,1]]
        lvl0_28.winColors = [[1,6,5,6,13],[1,6,13,6,13],[5,6,1,6,6],[13,6,13,6,1],[13,6,5,6,1]]
        lvl0_28.lvlID = 28
        lvl0_28.lvlIcon = "lvl0-28.png"
        lvl0_28.uID = "m0l28"
        lvl0_28.steps = 21
        
        //lvl 0 29
        lvl0_29.colors = [[1,13,6,1,1,1],[6,5,5,5,1,13],[1,5,13,1,13,1],[13,1,13,1,5,13],[1,13,5,5,5,6],[13,13,13,6,1,13]]
        lvl0_29.winColors = [[1,1,1,1,1,1],[1,5,5,5,1,13],[6,5,13,1,13,6],[6,1,13,1,5,6],[1,13,5,5,5,13],[13,13,13,13,13,13]]
        lvl0_29.lvlID = 29
        lvl0_29.lvlIcon = "lvl0-29.png"
        lvl0_29.uID = "m0l29"
        lvl0_29.steps = 24
        
        //lvl 0 30
        lvl0_30.colors = [[13,6,1,5,13,5],[1,5,1,5,5,5],[5,5,5,13,5,13],[6,1,5,1,5,13],[5,1,13,13,5,13],[13,5,1,5,1,1]]
        lvl0_30.winColors = [[1,5,1,1,13,5],[1,5,13,5,13,6],[1,5,1,5,5,5],[5,5,5,13,5,13],[6,1,5,1,5,13],[5,1,13,13,5,13]]
        lvl0_30.lvlID = 30
        lvl0_30.lvlIcon = "lvl0-30.png"
        lvl0_30.uID = "m0l30"
        lvl0_30.steps = 30
        
        
        
        //lvl 1 1
        lvl1_1.colors = [[3,3,7],[7,7,7],[7,7,3]]
        lvl1_1.winColors = [[3,7,7],[7,3,7],[7,7,3]]
        lvl1_1.lvlIcon = "lvl1-1.png"
        lvl1_1.scale = 1.335
        lvl1_1.uID = "m1l1"
        lvl1_1.timeMode = true
        lvl1_1.sec = 60
        lvl1_1.lvlID = 1
        
        //lvl 1 2
        lvl1_2.colors = [[7,3,7],[3,3,3],[7,3,7]]
        lvl1_2.winColors = [[7,7,3],[3,3,3],[3,7,7]]
        lvl1_2.lvlIcon = "lvl1-2.png"
        lvl1_2.scale = 1.36
        lvl1_2.uID = "m1l2"
        lvl1_2.timeMode = true
        lvl1_2.sec = 60
        lvl1_2.lvlID = 2
        
        //lvl 1 3
        lvl1_3.colors = [[7,3,7],[3,7,3],[3,7,7]]
        lvl1_3.winColors = [[3,3,7],[3,7,7],[7,7,3]]
        lvl1_3.lvlIcon = "lvl1-3.png"
        lvl1_3.scale = 1.36
        lvl1_3.uID = "m1l3"
        lvl1_3.timeMode = true
        lvl1_3.sec = 60
        lvl1_3.lvlID = 3
        
        //lvl 1 4
        lvl1_4.colors = [[7,3,3],[7,3,3],[3,3,3]]
        lvl1_4.winColors = [[7,3,3],[3,3,3],[7,3,3]]
        lvl1_4.lvlIcon = "lvl1-4.png"
        lvl1_4.uID = "m1l4"
        lvl1_4.timeMode = true
        lvl1_4.sec = 120
        lvl1_4.lvlID = 4
        
        //lvl 1 5
        lvl1_5.colors = [[3,3,7,7],[7,3,3,7],[7,3,3,7],[7,7,3,3]]
        lvl1_5.winColors = [[3,3,7,7],[3,3,7,7],[7,7,3,3],[7,7,3,3]]
        lvl1_5.lvlIcon = "lvl1-5.png"
        lvl1_5.uID = "m1l5"
        lvl1_5.timeMode = true
        lvl1_5.sec = 120
        lvl1_5.lvlID = 5
        
        //lvl 1 6
        lvl1_6.colors = [[0,0,0,0],[12,12,12,0],[0,12,12,12],[0,0,0,0]]
        lvl1_6.winColors = [[0,0,0,0],[0,12,12,12],[12,12,12,0],[0,0,0,0]]
        lvl1_6.lvlIcon = "lvl1-6.png"
        lvl1_6.uID = "m1l6"
        lvl1_6.timeMode = true
        lvl1_6.sec = 120
        lvl1_6.lvlID = 6
        
        //lvl 1 7
        lvl1_7.colors = [[12,0,12,12],[0,0,7,12],[7,7,0,12],[0,12,12,0]]
        lvl1_7.winColors = [[12,0,12,12],[0,0,7,12],[12,7,7,0],[12,12,0,0]]
        lvl1_7.lvlIcon = "lvl1-7.png"
        lvl1_7.uID = "m1l7"
        lvl1_7.timeMode = true
        lvl1_7.sec = 120
        lvl1_7.lvlID = 7
        
        //lvl 1 8
        lvl1_8.colors = [[12,0,0,0],[12,7,7,12],[12,7,7,12],[0,0,0,12]]
        lvl1_8.winColors = [[12,12,0,0],[12,7,7,0],[0,7,7,12],[0,0,12,12]]
        lvl1_8.lvlIcon = "lvl1-8.png"
        lvl1_8.uID = "m1l8"
        lvl1_8.timeMode = true
        lvl1_8.sec = 120
        lvl1_8.lvlID = 8
        
        //lvl 1 9
        lvl1_9.colors = [[0,0,7,0],[12,12,0,7],[7,0,12,12],[0,7,0,0]]
        lvl1_9.winColors = [[0,0,0,0],[12,7,12,7],[7,12,7,12],[0,0,0,0]]
        lvl1_9.lvlIcon = "lvl1-9.png"
        lvl1_9.uID = "m1l9"
        lvl1_9.timeMode = true
        lvl1_9.sec = 180
        lvl1_9.lvlID = 9
        
        //lvl 1 10
        lvl1_10.colors = [[0,0,7,7],[0,7,12,7],[7,12,7,0],[7,7,0,0]]
        lvl1_10.winColors = [[0,7,7,7],[0,0,12,7],[7,12,0,0],[7,7,7,0]]
        lvl1_10.lvlIcon = "lvl1-10.png"
        lvl1_10.uID = "m1l10"
        lvl1_10.timeMode = true
        lvl1_10.sec = 180
        lvl1_10.lvlID = 10
        
        //lvl 1 11
        lvl1_11.colors = [[2,13,2],[13,2,13],[10,2,13]]
        lvl1_11.winColors = [[13,2,13],[2,10,2],[13,2,13]]
        lvl1_11.lvlIcon = "lvl1-11.png"
        lvl1_11.uID = "m1l11"
        lvl1_11.timeMode = true
        lvl1_11.sec = 180
        lvl1_11.lvlID = 11
        
        //lvl 1 12
        lvl1_12.colors = [[3,13,13,3],[13,2,3,3],[3,13,13,13],[2,10,3,10]]
        lvl1_12.winColors = [[3,3,13,2],[3,10,13,13],[13,13,10,3],[2,13,3,3]]
        lvl1_12.lvlIcon = "lvl1-12.png"
        lvl1_12.uID = "m1l12"
        lvl1_12.timeMode = true
        lvl1_12.sec = 180
        lvl1_12.lvlID = 12
        
        //lvl 1 13
        lvl1_13.colors = [[3,3,13,2],[13,10,13,13],[3,13,10,13],[3,13,10,13]]
        lvl1_13.winColors = [[2,3,13,13],[3,10,10,13],[13,10,13,3],[13,13,3,2]]
        lvl1_13.lvlIcon = "lvl1-13.png"
        lvl1_13.uID = "m1l13"
        lvl1_13.timeMode = true
        lvl1_13.sec = 180
        lvl1_13.lvlID = 13
        
        //lvl 1 14
        lvl1_14.colors = [[13,11,3,13,13],[11,3,3,3,3],[3,3,3,3,3],[3,13,3,3,13],[13,10,13,13,13]]
        lvl1_14.winColors = [[13,3,13,3,13],[3,10,11,3,3],[3,11,3,3,3],[13,3,3,3,13],[13,13,3,13,13]]
        lvl1_14.lvlIcon = "lvl1-14.png"
        lvl1_14.uID = "m1l14"
        lvl1_14.timeMode = true
        lvl1_14.sec = 240
        lvl1_14.lvlID = 14
        
        //lvl 1 15
        lvl1_15.colors = [[3,13,2,13,3],[3,2,2,13,11],[11,13,3,3,13],[13,10,13,3,13],[2,2,13,13,13]]
        lvl1_15.winColors = [[2,3,13,13,13],[3,3,2,2,13],[13,11,13,2,13],[13,10,11,3,3],[13,13,13,3,2]]
        lvl1_15.lvlIcon = "lvl1-15.png"
        lvl1_15.uID = "m1l15"
        lvl1_15.timeMode = true
        lvl1_15.sec = 240
        lvl1_15.lvlID = 15
        
        //lvl 1 16
        lvl1_16.colors = [[8,7,9,13],[9,7,8,13],[13,9,7,8],[8,7,9,13]]
        lvl1_16.winColors = [[13,7,7,13],[8,9,9,8],[9,8,8,9],[13,7,7,13]]
        lvl1_16.lvlIcon = "lvl1-16.png"
        lvl1_16.uID = "m1l16"
        lvl1_16.timeMode = true
        lvl1_16.sec = 210
        lvl1_16.lvlID = 16
        
        //lvl 1 17
        lvl1_17.colors = [[13,9,7,8,5],[9,8,8,13,13],[9,9,13,9,8],[5,13,13,9,13],[13,9,13,13,9,13]]
        lvl1_17.winColors = [[9,9,13,5,13],[9,13,13,8,13],[9,8,7,8,9],[13,8,13,13,9],[13,5,13,9,9]]
        lvl1_17.lvlIcon = "lvl1-17.png"
        lvl1_17.uID = "m1l17"
        lvl1_17.timeMode = true
        lvl1_17.sec = 240
        lvl1_17.lvlID = 17
        
        //lvl 1 18
        lvl1_18.colors = [[7,3,13,13,13],[13,8,7,7,13],[13,13,9,9,8],[13,5,5,9,8],[5,13,13,3,3]]
        lvl1_18.winColors = [[5,13,13,3,3],[13,13,7,7,3],[13,8,8,7,13],[9,9,8,13,13],[5,9,13,13,5]]
        lvl1_18.lvlIcon = "lvl1-18.png"
        lvl1_18.uID = "m1l18"
        lvl1_18.timeMode = true
        lvl1_18.sec = 240
        lvl1_18.lvlID = 18
        
        //lvl 1 19
        lvl1_19.colors = [[13,8,5,7,9],[7,8,5,13,13],[13,3,3,9,8],[3,13,3,8,8],[13,8,7,13,7]]
        lvl1_19.winColors = [[8,8,7,13,13],[8,5,7,7,7],[13,5,13,9,13],[3,3,3,9,8],[13,13,3,8,8]]
        lvl1_19.lvlIcon = "lvl1-19.png"
        lvl1_19.uID = "m1l19"
        lvl1_19.timeMode = true
        lvl1_19.sec = 240
        lvl1_19.lvlID = 19
        
        //lvl 1 20
        lvl1_20.colors = [[8,9,7,9,5,5],[8,7,13,8,9,8],[3,7,5,7,8,8],[3,13,9,3,7,3],[13,5,9,13,3,3],[5,9,7,5,13,13]]
        lvl1_20.winColors = [[9,9,9,9,9,9],[8,8,8,8,8,8],[7,7,7,7,7,7],[3,3,3,3,3,3],[13,13,13,13,13,13],[5,5,5,5,5,5]]
        lvl1_20.lvlIcon = "lvl1-20.png"
        lvl1_20.uID = "m1l20"
        lvl1_20.timeMode = true
        lvl1_20.sec = 360
        lvl1_20.lvlID = 20
        //lvl 1 21
        lvl1_21.colors = [[3,7,8,3,8],[7,7,7,3,10],[3,7,7,3,8],[8,8,7,8,3],[3,8,8,7,3]]
        lvl1_21.winColors = [[3,8,8,8,3],[7,8,3,7,7],[7,3,10,3,7],[7,7,3,8,7],[3,8,8,8,3]]
        lvl1_21.lvlIcon = "lvl1-21.png"
        lvl1_21.uID = "m1l21"
        lvl1_21.timeMode = true
        lvl1_21.sec = 180
        lvl1_21.lvlID = 21
        
        //lvl 1 22
        lvl1_22.colors = [[7,3,8,10,3],[7,8,3,3,7],[11,10,8,3,7],[3,3,7,3,8],[7,7,8,8,8]]
        lvl1_22.winColors = [[7,7,3,7,3],[3,7,10,7,7],[3,7,11,8,3],[8,8,10,8,3],[3,8,3,8,8]]
        lvl1_22.lvlIcon = "lvl1-22.png"
        lvl1_22.uID = "m1l22"
        lvl1_22.timeMode = true
        lvl1_22.sec = 180
        lvl1_22.lvlID = 22
        
        //lvl 1 23
        lvl1_23.colors = [[8,3,8,3,3],[7,10,3,8,8],[3,7,7,7,3],[7,8,3,7,3],[8,7,8,7,8]]
        lvl1_23.winColors = [[3,8,3,7,3],[8,8,8,8,8],[3,8,10,7,3],[7,7,7,7,7],[3,8,3,7,3]]
        lvl1_23.lvlIcon = "lvl1-23.png"
        lvl1_23.uID = "m1l23"
        lvl1_23.timeMode = true
        lvl1_23.sec = 180
        lvl1_23.lvlID = 23
        
        //lvl 1 24
        lvl1_24.colors = [[3,7,8,3,3],[8,7,10,8,8],[7,7,7,7,3],[3,11,8,8,7],[3,8,7,10,8]]
        lvl1_24.winColors = [[3,8,8,8,7],[7,7,10,8,3],[3,7,11,8,3],[3,7,10,8,8],[8,7,7,7,3]]
        lvl1_24.lvlIcon = "lvl1-24.png"
        lvl1_24.uID = "m1l24"
        lvl1_24.timeMode = true
        lvl1_24.sec = 180
        lvl1_24.lvlID = 24
        
        //lvl 1 25
        lvl1_25.colors = [[7,7,3,10,8],[7,8,3,10,7],[3,7,3,8,3],[8,7,7,8,8],[8,3,8,7,11]]
        lvl1_25.winColors = [[3,7,3,7,7],[7,7,7,10,7],[3,7,11,8,3],[8,10,8,8,8],[8,8,3,8,3]]
        lvl1_25.lvlIcon = "lvl1-25.png"
        lvl1_25.uID = "m1l25"
        lvl1_25.timeMode = true
        lvl1_25.sec = 180
        lvl1_25.lvlID = 25
        
        //lvl 1 26
        lvl1_26.colors = [[6,13,13,3],[7,5,5,6],[5,6,6,7],[5,6,3,5]]
        lvl1_26.winColors = [[6,6,3,13],[6,7,5,5],[6,6,7,5],[13,3,5,5]]
        lvl1_26.lvlIcon = "lvl1-26.png"
        lvl1_26.uID = "m1l26"
        lvl1_26.timeMode = true
        lvl1_26.sec = 180
        lvl1_26.lvlID = 26
        
        //lvl 1 27
        lvl1_27.colors = [[13,13,3,7,13],[13,13,5,6,13],[13,5,6,5,13],[6,7,6,5,13],[13,5,6,7,3]]
        lvl1_27.winColors = [[13,13,5,13,13],[13,5,6,6,13],[13,6,7,6,5],[13,3,7,3,13]]
        lvl1_27.lvlIcon = "lvl1-27.png"
        lvl1_27.uID = "m1l27"
        lvl1_27.timeMode = true
        lvl1_27.sec = 180
        lvl1_27.lvlID = 27
        
        //lvl 1 28
        lvl1_28.colors = [[7,5,3,13,13],[7,5,7,3,6],[7,3,6,3,6],[7,5,3,13,13],[3,5,5,7,5]]
        lvl1_28.winColors = [[5,7,5,3,13],[13,7,5,7,3],[6,7,6,3,6],[7,3,5,3,13],[13,7,5,3,5]]
        lvl1_28.lvlIcon = "lvl1-28.png"
        lvl1_28.uID = "m1l28"
        lvl1_28.timeMode = true
        lvl1_28.sec = 180
        lvl1_28.lvlID = 28
        
        //lvl 1 29
        lvl1_29.colors = [[13,5,6,7,13,3],[5,13,13,13,3,3],[7,7,6,3,6,6],[13,6,13,5,3,13],[13,7,5,13,13,13],[6,7,7,6,6,3]]
        lvl1_29.winColors = [[13,6,5,13,3,13],[6,13,7,6,3,3],[5,7,7,13,6,13],[13,6,13,3,3,5],[7,7,6,3,13,6],[13,7,13,5,6,13]]
        lvl1_29.lvlIcon = "lvl1-29.png"
        lvl1_29.uID = "m1l29"
        lvl1_29.timeMode = true
        lvl1_29.sec = 240
        lvl1_29.lvlID = 29
        
        //lvl 1 30
        lvl1_30.colors = [[13,3,6,3,7,5],[13,5,6,6,3,3],[3,7,7,6,3,5],[7,6,7,5,13,3],[6,3,6,7,3,13],[6,6,7,7,7,3]]
        lvl1_30.winColors = [[13,5,6,7,3,13],[5,3,7,7,7,3],[3,7,6,7,3,7],[6,3,6,7,6,3],[3,6,6,6,3,5],[13,3,6,7,5,13]]
        lvl1_30.lvlIcon = "lvl1-30.png"
        lvl1_30.uID = "m1l30"
        lvl1_30.timeMode = true
        lvl1_30.sec = 240
        lvl1_30.lvlID = 30
    }
}


