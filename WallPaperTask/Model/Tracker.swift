//
//  Tracker.swift
//  WallPaperTask
//
//  Created by 築山朋紀 on 2018/12/29.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import Foundation
import Flurry_iOS_SDK

struct Tracker {
    
    private init() {}
    
    static func event(_ log: Event) {
        Flurry.logEvent(log.name)
    }
    
    static func setUserID() {
        if AppUser.deviceID == "" {
            AppUser.saveDeviceUUID((UIDevice.current.identifierForVendor?.uuidString)!)
        }
        Flurry.setUserID(AppUser.deviceID)
    }
}

enum Event {
    /// タスク追加
    case add
    
    /// タスク完了
    case done
    
    var name: String {
        switch self {
        case .add:
            return "タスク追加"
        case .done:
            return "タスク完了"
        }
    }
}
