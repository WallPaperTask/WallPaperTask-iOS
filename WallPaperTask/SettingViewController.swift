//
//  SettingViewController.swift
//  壁紙タスクン
//
//  Created by 築山朋紀 on 2018/10/04.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit
import SafariServices

class SettingViewController: UITableViewController {
    
    private let sections = ["サポート", "アプリについて"]
    private let supports = ["お問い合わせ"]
    private let apps = ["利用規約", "プライバシーポリシー", "ライセンス"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(hex: "E9E9E9")
        tableView.tableFooterView = UIView()
        navigationItem.title = "設定"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return supports.count
        case 1:
            return apps.count
        default:
            assertionFailure()
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = supports[indexPath.row]
            cell.accessoryType = .disclosureIndicator
        case 1:
            cell.textLabel?.text = apps[indexPath.row]
            cell.accessoryType = .disclosureIndicator
        default: break
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            performSegue(withIdentifier: "toInfo", sender: nil)
            
        case (1, 0):
            guard let url = URL(string: "https://tomoki69386.github.io/Qiita_Client/Service/Service") else { return }
            let SFVC = SFSafariViewController(url: url)
            present(SFVC, animated: true, completion: nil)
            
        case (1, 1):
            guard let url = URL(string: "https://tomoki69386.github.io/Qiita_Client/Privacy/Privacy") else { return }
            let SFVC = SFSafariViewController(url: url)
            present(SFVC, animated: true, completion: nil)
            
        case (1, 2):
            tableView.deselectRow(at: indexPath, animated: true)
            guard let url = URL(string: "https://tomoki69386.github.io/Qiita_Client/Privacy/Privacy") else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        default: break
        }
    }
}
