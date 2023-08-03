//
//  AddViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/07/31.
//

import UIKit

enum TransitionType {
    case add
    case edit
}

class AddViewController: UIViewController {
    
    static let identifier = "AddViewController"
    
    var type: TransitionType = .add
    var contents: String = ""
    
    @IBOutlet weak var mainContentsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        
        // 추가 화면 시 빈 텍스트 뷰, 수정 화면 시 이전 내용 값 전달
        switch type {
        case .add:
            title = "추가 화면"
            mainContentsTextView.text = contents
            
            let xmark = UIImage(systemName: "xmark")
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(closeButtonClicked))
            navigationItem.leftBarButtonItem?.tintColor = .red
        case .edit:
            title = "수정 화면"
            mainContentsTextView.text = contents
        }
    }
    
    @objc func closeButtonClicked() {
        //Present - Dismiss
        dismiss(animated: true)
    }
}

