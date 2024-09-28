//
//  LSLevelPacks.swift
//  LineSwipe
//
//  Created by Daniil Belov on 03.03.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSLevelPacks {
    var lvls = LSLevels()
    var pack1 : LSLevelPack
    var pack2 : LSLevelPack
    
    init() {
        pack1 = LSLevelPack(pages: [
            LSLevelsPage(levels: [lvls.lvl0_1, lvls.lvl0_2, lvls.lvl0_3, lvls.lvl0_4, lvls.lvl0_5, lvls.lvl0_6, lvls.lvl0_7, lvls.lvl0_8, lvls.lvl0_9, lvls.lvl0_10]),
            LSLevelsPage(levels: [lvls.lvl0_11, lvls.lvl0_12, lvls.lvl0_13, lvls.lvl0_14, lvls.lvl0_15, lvls.lvl0_16, lvls.lvl0_17, lvls.lvl0_18, lvls.lvl0_19, lvls.lvl0_20]),
            LSLevelsPage(levels: [lvls.lvl0_21, lvls.lvl0_22, lvls.lvl0_23, lvls.lvl0_24, lvls.lvl0_25, lvls.lvl0_26, lvls.lvl0_27, lvls.lvl0_28, lvls.lvl0_29, lvls.lvl0_30])
            ])
        pack1.pages[1].starsforenable = 20
        pack1.pages[2].starsforenable = 65
        if LSLanguage.lang == 0 {
            pack1.title = "smtitle.png"
        }
        if LSLanguage.lang == 1 {
            pack1.title = "smtitle_ru.png"
        }
        
        pack2 = LSLevelPack(pages: [
            LSLevelsPage(levels: [lvls.lvl1_1, lvls.lvl1_2, lvls.lvl1_3, lvls.lvl1_4, lvls.lvl1_5, lvls.lvl1_6, lvls.lvl1_7, lvls.lvl1_8, lvls.lvl1_9, lvls.lvl1_10]),
            LSLevelsPage(levels: [lvls.lvl1_11, lvls.lvl1_12, lvls.lvl1_13, lvls.lvl1_14, lvls.lvl1_15, lvls.lvl1_16, lvls.lvl1_17, lvls.lvl1_18, lvls.lvl1_19, lvls.lvl1_20]),
            LSLevelsPage(levels: [lvls.lvl1_21,lvls.lvl1_22,lvls.lvl1_23,lvls.lvl1_24,lvls.lvl1_25,lvls.lvl1_26,lvls.lvl1_27,lvls.lvl1_28,lvls.lvl1_29,lvls.lvl1_30])
            ])
        pack2.title = "pack1title.png"
        pack2.pages[1].starsforenable = 20
        pack2.pages[2].starsforenable = 45
        
        if LSLanguage.lang == 0 {
            pack2.title = "pack1title.png"
        }
        if LSLanguage.lang == 1 {
            pack2.title = "pack1title_ru.png"
        }
    }
}

