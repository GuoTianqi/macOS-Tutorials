//
//  Preferences.swift
//  EggTimer
//
//  Created by 郭天祈 on 2018/8/26.
//  Copyright © 2018年 郭天祈. All rights reserved.
//

import Foundation

struct Preferences {
    private static let KEY_SELECTED_TIME = "selectedTime"
    
    var selectedTime: TimeInterval {
        get {
            let savedTime = UserDefaults.standard.double(forKey: Preferences.KEY_SELECTED_TIME)
            if savedTime > 0 {
                return savedTime
            }
            
            return 360
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: Preferences.KEY_SELECTED_TIME)
        }
    }
}
