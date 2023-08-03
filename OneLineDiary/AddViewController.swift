//
//  AddViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/07/31.
//

import UIKit

enum TransitionType: String {
    case add = "추가 화면"
    case edit = "수정 화면"
}

//1. UITextViewDelegate
//2. mainContentsTextView.delegate = self
//3. 프로토콜의 필수 구현사항은 메서드를 호출을 통해 구현
class AddViewController: UIViewController, UITextViewDelegate {
    
    static let identifier = "AddViewController"
    
    var type: TransitionType = .add
    var contents: String = ""
    
    @IBOutlet weak var mainContentsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainContentsTextView.delegate = self
        
        setBackgroundColor()
        mainContentsTextView.text = contents
        title = type.rawValue
        
        // 추가 화면 시 빈 텍스트 뷰, 수정 화면 시 이전 내용 값 전달
        switch type {
        case .add:
            let xmark = UIImage(systemName: "xmark")
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(closeButtonClicked))
            navigationItem.leftBarButtonItem?.tintColor = .red
            
        case .edit:
            print("EDIT")
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
        title = "총 \(textView.text.count) 글자"
    }
    
    
    @objc func closeButtonClicked() {
        //Present - Dismiss
        dismiss(animated: true)
    }
}

