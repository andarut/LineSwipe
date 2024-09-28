//
//  LSPages.swift
//  LineSwipe
//
//  Created by Daniil Belov on 21.02.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSPages {
    var lvls = LSLevels()
    var page0_1 : LSLevelsPage
    
    init() {
        page0_1 = LSLevelsPage(levels: [lvls.lvl0_1, lvls.lvl0_2, lvls.lvl0_3, lvls.lvl0_4, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1, lvls.lvl1])
    }
}
