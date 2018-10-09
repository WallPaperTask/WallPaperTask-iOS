//
//  WalllPaper1View.swift
//  壁紙タスクン
//
//  Created by 築山朋紀 on 2018/10/06.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit
import RealmSwift

class WallPaper1View: UIView {
	
	let tableView = UITableView()
	let realm = try! Realm()

	required override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = UIColor(hex: "174E49")
		
		tableView.register(WallPaper1TableViewCell.self, forCellReuseIdentifier: "cell1")
		tableView.dataSource = self
		tableView.rowHeight = 40
		tableView.separatorStyle = .none
		tableView.isScrollEnabled = false
		tableView.allowsSelection = false
		
		addSubview(tableView)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		tableView.frame = CGRect(x: 0, y: 210, width: frame.width, height: 320)
	}
}

extension WallPaper1View: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 8
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! WallPaper1TableViewCell
		let todoCollection = realm.objects(Todo.self)
		if todoCollection.count > indexPath.row {
			cell.label.text = todoCollection[indexPath.row].title
		}
		return cell
	}
}
