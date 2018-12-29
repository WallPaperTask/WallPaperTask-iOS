//
//  TaskIndexTableViewCell.swift
//  WallPaperTask
//
//  Created by 築山朋紀 on 2018/10/09.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit
import RealmSwift

class TaskIndexTableViewCell: UITableViewCell {
	
	private let backView = UIView()
	let CheckBox = UIButton()
	let label = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		backView.layer.shadowOpacity = 0.5
		backView.layer.shadowRadius = 12
		backView.layer.shadowColor = UIColor.black.cgColor
		backView.layer.shadowOffset = CGSize(width: 5, height: 5)
		
		backView.backgroundColor = UIColor.white
		backView.layer.cornerRadius = 5
		
		CheckBox.layer.borderWidth = 1
		CheckBox.layer.borderColor = UIColor(hex: "707070").cgColor
		CheckBox.layer.cornerRadius = 5
		CheckBox.addTarget(self, action: #selector(TaskIndexTableViewCell.check(sender:)), for: .touchUpInside)
		
		label.textColor = UIColor.black
		label.textAlignment = NSTextAlignment.left
		
		contentView.backgroundColor = UIColor.clear
		backgroundColor = UIColor.clear
		contentView.addSubview(backView)
		backView.addSubview(CheckBox)
		backView.addSubview(label)
	}
	
	@objc private func check(sender: UIButton) {
		CheckBox.backgroundColor = UIColor.black
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
			let realm = try! Realm()
			var todo: Results<Todo>!
			todo = realm.objects(Todo.self)
			try! realm.write {
				realm.delete(todo[sender.tag - 1])
				self.CheckBox.backgroundColor = UIColor.white
                Tracker.event(.done)
			}
		}
	}
	
	override func layoutSubviews() {
		backView.frame = CGRect(x: contentView.frame.width / 20, y: 5, width: contentView.frame.width / 20 * 18, height: 50)
		CheckBox.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
		label.frame = CGRect(x: 50, y: 0, width: backView.frame.width - 50, height: 50)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}

