//
//  LottoViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/08/03.
//

import UIKit

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var numberTextField: UITextField!
    let pickerView = UIPickerView() // IBOutlet 대신 활용
    
    var genreList = ["Romance Comedy", "Drama", "Animation", "Thriller", "Action"]
    var repeatingList = Array(repeating: "20", count: 30)
    var list = Array(1...100).reversed().map { String($0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTextField.inputView = pickerView
        numberTextField.tintColor = .clear // 커서 가리기
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("DID SELECT \(row)")
        numberTextField.text = list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }

}
