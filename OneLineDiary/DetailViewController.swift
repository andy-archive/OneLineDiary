//
//  DetailViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()

    }
    
    @IBAction func deleteButtonClicked(_ sender: UIBarButtonItem) {
        // push - pop (nav)
        navigationController?.popViewController(animated: true)
    }
    
}
