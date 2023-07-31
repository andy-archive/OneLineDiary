//
//  DiaryTableViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/07/31.
//

import UIKit

class DiaryTableViewController: UITableViewController {

    var list = ["영등포구", "동작구", "마포구", "양천구", "서대문구", "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 우리나라 만세"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        
        //XIB 테이블셀을 생성할 경우, 테이블 뷰에 사용할 셀을 등록해주는 과정이 필요하다
        let nib = UINib(nibName: "DiaryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DiaryTableViewCell")
        
        // tableView.backgroundColor = .clear
        
        ///Dynamic Height
        ///1. [UITableView] automaticDimension
        ///2. [UILabel] numberOfLines
        ///3. [Storyboard] AutoLayout
        tableView.rowHeight = UITableView.automaticDimension

    }

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        ///1. Storyboard 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        ///2. Storyboard 파일 안의 ViewController 찾기
        guard let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController else {
            print("ERROR")
            return
        }
        
        /// 2-1 Navigation Controller가 있는 형태로 present 하고 싶은 경우
        /// nav를 사용하면 present와 화면 전환 방식도 nav로 수정해주어야 한다
        let nav = UINavigationController(rootViewController: vc)
        
        ///3. 화면 전환 방식 설정
        nav.modalTransitionStyle = .crossDissolve // 모달의 애니메이션
        nav.modalPresentationStyle = .fullScreen // 모달의 방식
        
        ///4. 화면 띄우기
        present(nav, animated: true) // 모달
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryTableViewCell") as? DiaryTableViewCell else {
            print("ERROR")
            return UITableViewCell()
        }
        
        let row = indexPath.row
        
        cell.contentLabel.text = list[row]
        cell.contentLabel.numberOfLines = 0
        cell.backgroundColor = .clear
        
        return cell
    }
    
    ///1. canEditRowAt ==> Sytem Delete
    /// 편집 상태로 만들겠다 - true
    /// 편집 상태로 안 만들겠다 - false
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /// 2. commit ==> Sytem Delete
    /// 삭제에 대한 옵션 설정
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        
        list.remove(at: row)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            print("ERROR")
            return
        }
        
        // ⭐️ Interface Builder에 Navigation Controller가 imbedded 되어야만 push가 동작한다!
        navigationController?.pushViewController(vc, animated: true)
    }

//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//         UISwipeActionsConfiguration(actions: <#T##[UIContextualAction]#>)
//    }
//
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//         UISwipeActionsConfiguration(actions: <#T##[UIContextualAction]#>)
//    }
    
}
