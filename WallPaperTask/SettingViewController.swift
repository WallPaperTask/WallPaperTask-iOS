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
    
    private let support = ["レビューする", "不具合を報告する", "お問い合わせする"]
    private let service = ["利用規約", "プライバシーポリシー", "運営者", "ライセンス"]
    //let version: String! = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as String

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.sectionHeaderHeight = 40
        tableView.backgroundColor = UIColor(hex: "F6F6F6")
		
		setLayout()
    }
	
	private func setLayout() {
		navigationItem.title = "設定"
	}
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY <= tableView.sectionHeaderHeight && offsetY >= 0 {
            scrollView.contentInset = UIEdgeInsets(top: -offsetY, left: 0, bottom: 0, right: 0)
        } else if offsetY >= tableView.sectionHeaderHeight {
            scrollView.contentInset = UIEdgeInsets(top: -tableView.sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
    }
}

extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return support.count
        case 1:
            return service.count
        case 2:
            return 1
        default:
            assertionFailure()
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = support[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = service[indexPath.row]
        } else {
            let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
            cell.textLabel?.text = version
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = UIColor(hex: "F6F6F6")
        return label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        print(indexPath.row)
    }
}
