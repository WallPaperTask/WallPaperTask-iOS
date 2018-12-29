//
//  AppUser.swift
//  WallPaperTask
//
//  Created by 築山朋紀 on 2018/12/29.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import SwiftyUserDefaults

struct AppUser {
    private init() {}
    
    /// DeviceUUID
    static var deviceID: String {
        return Defaults[.deviceID]
    }
}

extension AppUser {
    static func saveDeviceUUID(_ id: String) {
        Defaults[.deviceID] = id
    }
}

private extension DefaultsKeys {
    static let deviceID = DefaultsKey<String>("Device_UUID")
}
