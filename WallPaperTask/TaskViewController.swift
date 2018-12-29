//
//  TaskViewController.swift
//  WallPaperTask
//
//  Created by 築山朋紀 on 2018/10/09.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit
import RealmSwift

class TaskViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	private let toWallpaper = UIButton()
	private let realm = try! Realm()
	private var todoList: Results<Todo>!
	private var token: NotificationToken!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.dataSource = self
		tableView.register(TaskAddTableViewCell.self, forCellReuseIdentifier: "TaskAdd")
		tableView.register(TaskIndexTableViewCell.self, forCellReuseIdentifier: "TaskIndex")
		tableView.register(SpaceTableViewCell.self, forCellReuseIdentifier: "Space")
		tableView.rowHeight = 60
		tableView.allowsSelection = false
		tableView.separatorColor = UIColor.clear
		
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
		imageView.image = UIImage(named: "https___www.pakutaso.com_shared_img_thumb_HIRO88_tokyottokanransya")
		tableView.backgroundView = imageView
		
		toWallpaper.frame = CGRect(x: (view.frame.width - 70) / 2, y: view.frame.height - 100, width: 70, height: 70)
		toWallpaper.setImage(UIImage(named: "s512_f_business_58_2bg"), for: .normal)
		toWallpaper.layer.cornerRadius = 35
		toWallpaper.clipsToBounds = true
		toWallpaper.addTarget(self, action: #selector(TaskViewController.tap), for: .touchUpInside)
		view.addSubview(toWallpaper)
		
		todoList = realm.objects(Todo.self)
		token = todoList.observe { [weak self] _ in
			self?.reload()
		}
	}
	
	private func reload() {
		tableView.reloadData()
	}
	
	@objc private func tap() {
		let button = self.toWallpaper
		UIView.animate(withDuration: 0.05, animations: {[weak button] in
			button?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
			}, completion: { _ in
				UIView.animate(withDuration: 0.03) {[weak button] in
					button?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
				}
		})
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
			self.performSegue(withIdentifier: "toWallPaper", sender: nil)
		}
	}
}

extension TaskViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let todoCollection = realm.objects(Todo.self)
		return 1 + todoCollection.count + 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let todoCollection = realm.objects(Todo.self)
		
		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "TaskAdd", for: indexPath) as! TaskAddTableViewCell
			
			return cell
		}else if indexPath.row <= todoCollection.count {
			let cell = tableView.dequeueReusableCell(withIdentifier: "TaskIndex", for: indexPath) as! TaskIndexTableViewCell
			
			cell.CheckBox.tag = indexPath.row
			let todo = todoCollection[indexPath.row - 1]
			cell.label.text = todo.title
			
			return cell
		}else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Space", for: indexPath) as! SpaceTableViewCell
			
			return cell
		}
	}
}
