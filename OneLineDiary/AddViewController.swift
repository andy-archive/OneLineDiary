//
//  AddViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/07/31.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        
        title = "추가된 화면"
        
        let xmark = UIImage(systemName: "xmark")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(closeButtonClicked))
    
        navigationItem.leftBarButtonItem?.tintColor = .red
    }
    
    @objc
    func closeButtonClicked() {
        
        //Present - Dismiss
        dismiss(animated: true)
    }
}

