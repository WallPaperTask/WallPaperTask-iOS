//
//  WallPaper2View.swift
//  壁紙タスクン
//
//  Created by 築山朋紀 on 2018/10/07.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit
import RealmSwift

class WallPaper2View: UIView {
	
	private let label1 = UILabel()
	private let label2 = UILabel()
	private let label3 = UILabel()
	private let label4 = UILabel()
	private let label5 = UILabel()
	private let label6 = UILabel()
	private let colorItems: [String] = ["28C0D0", "A4D35B", "F8A8C5", "F8CD49"]
	private let realm = try! Realm()
	
	required override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = UIColor(hex: "174E49")
		label1.font = UIFont.systemFont(ofSize: 20)
		label2.font = UIFont.systemFont(ofSize: 20)
		label3.font = UIFont.systemFont(ofSize: 20)
		label4.font = UIFont.systemFont(ofSize: 20)
		label5.font = UIFont.systemFont(ofSize: 20)
		label6.font = UIFont.systemFont(ofSize: 20)
		
		label1.textAlignment = NSTextAlignment.center
		label2.textAlignment = NSTextAlignment.center
		label3.textAlignment = NSTextAlignment.center
		label4.textAlignment = NSTextAlignment.center
		label5.textAlignment = NSTextAlignment.center
		label6.textAlignment = NSTextAlignment.center
	
		textSet()
		labelColor()
		
		addSubview(label1)
		addSubview(label2)
		addSubview(label3)
		addSubview(label4)
		addSubview(label5)
		addSubview(label6)
	}
	
	@objc func labelColor() {
		label1.backgroundColor = UIColor(hex: colorItems[random()])
		label2.backgroundColor = UIColor(hex: colorItems[random()])
		label3.backgroundColor = UIColor(hex: colorItems[random()])
		label4.backgroundColor = UIColor(hex: colorItems[random()])
		label5.backgroundColor = UIColor(hex: colorItems[random()])
		label6.backgroundColor = UIColor(hex: colorItems[random()])
	}
	
	private func random() -> Int {
		let index = (Int)(arc4random_uniform(4))
		return index
	}
	
	private func textSet() {
		let todoCollection = realm.objects(Todo.self)
		switch todoCollection.count {
		case 6:
			label6.text = todoCollection[5].title
			fallthrough
		case 5:
			label5.text = todoCollection[4].title
			fallthrough
		case 4:
			label4.text = todoCollection[3].title
			fallthrough
		case 3:
			label3.text = todoCollection[2].title
			fallthrough
		case 2:
			label2.text = todoCollection[1].title
			fallthrough
		case 1:
			label1.text = todoCollection[0].title
			fallthrough
		default:
			if todoCollection.count >= 6 {
				label1.text = todoCollection[0].title
				label2.text = todoCollection[1].title
				label3.text = todoCollection[2].title
				label4.text = todoCollection[3].title
				label5.text = todoCollection[4].title
				label6.text = todoCollection[5].title
			}
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		label1.frame = CGRect(x: frame.width / 10, y: 210, width: frame.width / 10 * 8, height: 45)
		label2.frame = CGRect(x: frame.width / 10, y: 260, width: frame.width / 10 * 8, height: 45)
		label3.frame = CGRect(x: frame.width / 10, y: 310, width: frame.width / 10 * 8, height: 45)
		label4.frame = CGRect(x: frame.width / 10, y: 360, width: frame.width / 10 * 8, height: 45)
		label5.frame = CGRect(x: frame.width / 10, y: 410, width: frame.width / 10 * 8, height: 45)
		label6.frame = CGRect(x: frame.width / 10, y: 460, width: frame.width / 10 * 8, height: 45)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
}
