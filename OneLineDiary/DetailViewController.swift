//
//  DetailViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    
    @IBOutlet weak var contentsLabel: UILabel!
    
    // Pass Data 1. 데이터를 받을 공간(프로퍼티) 생성
    var contents: String = "빈 공간"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        
        // Pass Data 3. 전달 받은 프로퍼티의 값을 뷰에 표현
        print(contents)
        contentsLabel.text = contents
        contentsLabel.textColor = .white
        contentsLabel.backgroundColor = .systemBlue
        contentsLabel.numberOfLines = 0

    }
    
    @IBAction func deleteButtonClicked(_ sender: UIBarButtonItem) {
        // push - pop (nav)
        navigationController?.popViewController(animated: true)
    }
    
}
