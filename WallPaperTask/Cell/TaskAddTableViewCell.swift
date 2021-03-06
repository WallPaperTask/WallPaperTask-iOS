//
//  TaskAddTableViewCell.swift
//  WallPaperTask
//
//  Created by 築山朋紀 on 2018/10/09.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit
import RealmSwift
import StoreKit

class TaskAddTableViewCell: UITableViewCell {
	
	private let backView = UIView()
	private let addButton = UIButton()
	private let taskInput = UITextField()
	private let userDefaults = UserDefaults.standard
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		addButton.setTitle("+", for: .normal)
		addButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
		addButton.addTarget(self, action: #selector(TaskAddTableViewCell.taskSave(sender:)), for: .touchUpInside)
		
		backView.backgroundColor = UIColor(hex: "00bfff")
		backView.layer.cornerRadius = 5
		
		taskInput.textColor = UIColor.white
		taskInput.delegate = self
		taskInput.attributedPlaceholder = NSAttributedString(string: "Taskを追加...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
		
		contentView.backgroundColor = UIColor.clear
		backgroundColor = UIColor.clear
		contentView.addSubview(backView)
		backView.addSubview(addButton)
		backView.addSubview(taskInput)
	}
	
	@objc private func taskSave(sender: UIButton) {
		guard let text = taskInput.text else {return}
		if text.isEmpty == false {
			save(title: text)
			taskInput.text = ""
		}
	}
	
	private func save(title: String) {
		let realm = try! Realm()
		let todo = Todo()
		todo.title = title
		try! realm.write {
			realm.add(todo)
		}
		if todo.count() {
			SKStoreReviewController.requestReview()
		}
        Tracker.event(.add)
	}
	
	override func layoutSubviews() {
		backView.frame = CGRect(x: contentView.frame.width / 20, y: 5, width: contentView.frame.width / 20 * 18, height: 50)
		addButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		taskInput.frame = CGRect(x: 50, y: 0, width: backView.frame.width - 50, height: 50)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}

extension TaskAddTableViewCell: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		guard let text = taskInput.text else {return true}
		if text.isEmpty == false {
			save(title: text)
			taskInput.text = ""
		}
		textField.resignFirstResponder()
		return true
	}
}

