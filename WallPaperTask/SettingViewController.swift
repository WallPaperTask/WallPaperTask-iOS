//
//  SettingViewController.swift
//  壁紙タスクン
//
//  Created by 築山朋紀 on 2018/10/04.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		setLayout()
    }
	
	private func setLayout() {
		navigationItem.title = "設定"
	}
}
