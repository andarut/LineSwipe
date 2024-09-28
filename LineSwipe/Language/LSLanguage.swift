//
//  LSLanguage.swift
//  LineSwipe
//
//  Created by Daniil Belov on 12.05.2018.
//  Copyright © 2018 Daniil Belov. All rights reserved.
//

import UIKit

class LSLanguage {
    static var lang = 1
    
    var en = ["COMING SOON...", "LEVEL", "wAwesome.png", "wExcelent.png", "wGood.png", "nsteps.png", "ntime.png", "selectmode.png", "restartpanel.png", "CUSTOM LVL", "DAILY"]
    var ru = ["СКОРО...", "УРОВЕНЬ", "wAwesome_ru.png", "wExcelent_ru.png", "wGood_ru.png", "nsteps_ru.png", "ntime_ru.png", "selectmode_ru.png", "restartpanel_ru.png", "ГЕНЕРАЦИЯ", "ЕЖЕДНЕВНЫЙ"]
    var yk = ["СКОРО...", "РІВЕНЬ", "wAwesome_ru.png", "wExcelent_ru.png", "wGood_ru.png", "nsteps_ru.png", "ntime_ru.png", "selectmode_ru.png", "restartpanel_ru.png", "ГЕНЕРАЦИЯ", "ЩОДЕННЫЙ"]
    
    var sEn = ["SETTINGS", "SOUND", "СOLOR BLINDNESS", "ANIMATION", "LIMITED STEPS","LIMITED TIME"]
    var sRu = ["НАСТРОЙКИ", "ЗВУК", "ДАЛЬТОНИЗМ", "АНИМАЦИИ", "НА ХОДЫ", "НА ВРЕМЯ"]
    var sYk = ["НАЛАШТУВАННЯ", "ЗВУК", "ДАЛЬТОНIЗМ", "АНИМАЦИИ", "ОБМЕЖЕНI КРОКИ", "ОБМЕЖЕНИЙ ЧАС"]
    
    var mEn = ["companybtn.png","generate.png","companytitle.png", "cnmb.png","ctmb.png", "csm.png", "tt1.png", "tt2.png", "tst1.png", "TUTORIAL", "shoptitle.png", "dcbtn.png", "dctommorow.png", "ONE WILL", "REGENERATED IN", "noenergy.png"]
    var mRu = ["companybtn_ru.png","generate_ru.png","companytitle_ru.png", "cnmb_ru.png","ctmb_ru.png", "csm_ru.png", "tt1_ru.png", "tt2_ru.png", "tst1_ru.png", "ОБУЧЕНИЕ", "shoptitle_ru.png", "dcbtn_ru.png", "dctommorow_ru.png", "ДО ВОСТАНОВЛЕНИЯ", "ЕДИНИЦЫ ОСТАЛОСЬ", "noenergy_ru.png"]
    var mUc = ["companybtn_ru.png","generate_ru.png","companytitle_ru.png", "cnmb_ru.png","ctmb_ru.png", "csm_ru.png", "tt1_ru.png", "tt2_ru.png", "tst1_ru.png", "НАВЧАННЯ", "shoptitle_ru.png", "dcbtn_ru.png", "dctommorow_ru.png", "ДО ВООСТАНОВЛЕНИЕ ЕДИНИЦЫ ОСТАЛОСЬ "]
    
    var gEn = ["gencreate.png"]
    var gRu = ["gencreate_ru.png"]
    var gUc = ["gencreate_ru.png"]
    
    var langs = [[String]]()
    var sLangs = [[String]]()
    var mLangs = [[String]]()
    var gLangs = [[String]]()
    
    init() {
        langs = [en, ru, yk]
        sLangs = [sEn, sRu, sYk]
        mLangs = [mEn, mRu, mUc]
        gLangs = [gEn, gRu, gUc]
    }
}

