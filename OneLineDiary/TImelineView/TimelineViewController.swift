//
//  TimelineViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/08/02.
//

import UIKit

/*
 1. 프로토콜 선언(일종의 부하직원) - UICollectionViewDelegate, UICollectionViewDataSource
 2. 컬렉션 뷰와 프로토콜을 연결 - delegate = self (타입으로서 프로토콜을 사용)
 3. 컬렉션 뷰 아웃렛 (이름 설정)
 */

class TimelineViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var todayCollectionView: UICollectionView!
    @IBOutlet weak var bestCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        
        bestCollectionView.delegate = self
        bestCollectionView.dataSource = self
        
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        todayCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        bestCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        configureTodayCollectionViewLayout()
        configureBestCollectionViewLayout()
    }
    
    func configureTodayCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        todayCollectionView.collectionViewLayout = layout
    }
    
    func configureBestCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        bestCollectionView.collectionViewLayout = layout
        
        // UIScreen.main.bounds.width 기준으로 페이징이 움직임
        bestCollectionView.isPagingEnabled = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == todayCollectionView {
            return 3
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {
            print("ERROR")
            return UICollectionViewCell()
        }
        
        if collectionView == todayCollectionView {
            cell.contentsLabel.text = "Today is \(indexPath.item)"
            cell.backgroundColor = .systemOrange
        } else {
            cell.contentsLabel.text = "Best is \(indexPath.item)"
            cell.backgroundColor = [.gray, .yellow, .red, .orange, .blue].randomElement()!
        }
        
        return cell
    }
}
