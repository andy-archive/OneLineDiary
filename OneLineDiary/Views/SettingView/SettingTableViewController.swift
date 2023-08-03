//
//  SettingTableViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/08/01.
//

import UIKit

enum Settings: Int, CaseIterable {
    case overall, personal, others
    
    var mainOptions: String {
        switch self {
        case .overall: return "전체 설정"
        case .personal: return "개인 설정"
        case .others: return "기타"
        }
    }
    
    var subOptions: [String] {
        switch self {
        case .overall: return ["공지사항", "실험실", "버전 정보"]
        case .personal: return  ["개인/보안", "알림", "채팅", "멀티 프로필"]
        case .others: return  ["고객센터/도움말"]
        }
    }
}

class SettingTableViewController: UITableViewController {
    
    static let identifier = "SettingTableViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Settings.allCases.count
    }
    
    /// allCases
    /// 0번 - 3개
    /// 1번 - 4개
    /// 2번 - 1개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.allCases[section].subOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        cell.textLabel?.text = Settings.allCases[indexPath.section].subOptions[indexPath.row]
        cell.textLabel?.textColor = .brown
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Settings.allCases[section].mainOptions
    }
}
