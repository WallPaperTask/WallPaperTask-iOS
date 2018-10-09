//
//  WallPaper3View.swift
//  壁紙タスクン
//
//  Created by 築山朋紀 on 2018/10/07.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit
import RealmSwift

class WallPaper3View: UIView {
	
	let realm = try! Realm()
	
	let blueLine1 = UIView()
	let blueLine2 = UIView()
	let blueLine3 = UIView()
	let blueLine4 = UIView()
	let blueLine5 = UIView()
	let blueLine6 = UIView()
	let blueLine7 = UIView()
	
	let star1 = UIImageView()
	let star2 = UIImageView()
	let star3 = UIImageView()
	let star4 = UIImageView()
	let star5 = UIImageView()
	let star6 = UIImageView()
	
	let label1 = UILabel()
	let label2 = UILabel()
	let label3 = UILabel()
	let label4 = UILabel()
	let label5 = UILabel()
	let label6 = UILabel()

	required override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = UIColor(hex: "F0F0F0")
		
		blueLine1.layer.borderWidth = 1
		blueLine2.layer.borderWidth = 1
		blueLine3.layer.borderWidth = 1
		blueLine4.layer.borderWidth = 1
		blueLine5.layer.borderWidth = 1
		blueLine6.layer.borderWidth = 1
		blueLine7.layer.borderWidth = 1
		
		//"28C0D0"
		blueLine1.layer.borderColor = UIColor(hex: "28C0D0").cgColor
		blueLine2.layer.borderColor = UIColor(hex: "28C0D0").cgColor
		blueLine3.layer.borderColor = UIColor(hex: "28C0D0").cgColor
		blueLine4.layer.borderColor = UIColor(hex: "28C0D0").cgColor
		blueLine5.layer.borderColor = UIColor(hex: "28C0D0").cgColor
		blueLine6.layer.borderColor = UIColor(hex: "28C0D0").cgColor
		blueLine7.layer.borderColor = UIColor(hex: "28C0D0").cgColor
		
		addSubview(blueLine1)
		addSubview(blueLine2)
		addSubview(blueLine3)
		addSubview(blueLine4)
		addSubview(blueLine5)
		addSubview(blueLine6)
		addSubview(blueLine7)
		
		star1.image = UIImage(named: "Yellow_star")
		star2.image = UIImage(named: "Blue_star")
		star3.image = UIImage(named: "Yellow_star")
		star4.image = UIImage(named: "Blue_star")
		star5.image = UIImage(named: "Yellow_star")
		star6.image = UIImage(named: "Blue_star")
		
		addSubview(star1)
		addSubview(star2)
		addSubview(star3)
		addSubview(star4)
		addSubview(star5)
		addSubview(star6)
		
		label1.textAlignment = NSTextAlignment.left
		label2.textAlignment = NSTextAlignment.left
		label3.textAlignment = NSTextAlignment.left
		label4.textAlignment = NSTextAlignment.left
		label5.textAlignment = NSTextAlignment.left
		label6.textAlignment = NSTextAlignment.left
		
		label1.font = UIFont.systemFont(ofSize: 20)
		label2.font = UIFont.systemFont(ofSize: 20)
		label3.font = UIFont.systemFont(ofSize: 20)
		label4.font = UIFont.systemFont(ofSize: 20)
		label5.font = UIFont.systemFont(ofSize: 20)
		label6.font = UIFont.systemFont(ofSize: 20)
		
		textSet()
		
		addSubview(label1)
		addSubview(label2)
		addSubview(label3)
		addSubview(label4)
		addSubview(label5)
		addSubview(label6)
	}
	
	func textSet() {
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
		
		blueLine1.frame = CGRect(x: 0, y: 210, width: frame.width, height: 1)
		blueLine2.frame = CGRect(x: 0, y: 260, width: frame.width, height: 1)
		blueLine3.frame = CGRect(x: 0, y: 310, width: frame.width, height: 1)
		blueLine4.frame = CGRect(x: 0, y: 360, width: frame.width, height: 1)
		blueLine5.frame = CGRect(x: 0, y: 410, width: frame.width, height: 1)
		blueLine6.frame = CGRect(x: 0, y: 460, width: frame.width, height: 1)
		blueLine7.frame = CGRect(x: 0, y: 510, width: frame.width, height: 1)
		
		star1.frame = CGRect(x: 15, y: blueLine1.frame.maxY + 15, width: 20, height: 20)
		star2.frame = CGRect(x: 15, y: blueLine2.frame.maxY + 15, width: 20, height: 20)
		star3.frame = CGRect(x: 15, y: blueLine3.frame.maxY + 15, width: 20, height: 20)
		star4.frame = CGRect(x: 15, y: blueLine4.frame.maxY + 15, width: 20, height: 20)
		star5.frame = CGRect(x: 15, y: blueLine5.frame.maxY + 15, width: 20, height: 20)
		star6.frame = CGRect(x: 15, y: blueLine6.frame.maxY + 15, width: 20, height: 20)
		
		label1.frame = CGRect(x: 50, y: blueLine1.frame.maxY, width: frame.width - 50, height: 50)
		label2.frame = CGRect(x: 50, y: blueLine2.frame.maxY, width: frame.width - 50, height: 50)
		label3.frame = CGRect(x: 50, y: blueLine3.frame.maxY, width: frame.width - 50, height: 50)
		label4.frame = CGRect(x: 50, y: blueLine4.frame.maxY, width: frame.width - 50, height: 50)
		label5.frame = CGRect(x: 50, y: blueLine5.frame.maxY, width: frame.width - 50, height: 50)
		label6.frame = CGRect(x: 50, y: blueLine6.frame.maxY, width: frame.width - 50, height: 50)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
