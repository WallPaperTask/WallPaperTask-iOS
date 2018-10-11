//
//  ToDo.swift
//  壁紙タスクン
//
//  Created by 築山朋紀 on 2018/10/07.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
	@objc dynamic var title = ""
	
	func count() -> Bool {
		let userDefaults = UserDefaults.standard
		userDefaults.register(defaults: ["count" : 0])
		var count = userDefaults.integer(forKey: "count")
		count += 1
		userDefaults.set(count, forKey: "count")
		if count == 10 {
			return true
		}else {
			return false
		}
	}
}
