//
//  SearchCollectionViewController.swift
//  OneLineDiary
//
//  Created by Taekwon Lee on 2023/07/31.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController {

    static let identifier = "SearchCollectionViewController"
    
    let searchBar = UISearchBar()
    let appleProductList = ["iPhone", "iPad", "Apple Watch", "Apple Vision Pro", "MacBook", "Mac mini", "사자", "사과"]
    var searchList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력하세요"
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        
        let nib = UINib(nibName: SearchCollectionViewCell.identifier, bundle: nil)

        collectionView.register(nib, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        
        setCollectionViewLayout()
    }

    func setCollectionViewLayout() {
        // cell estimated size를 none으로 Interface Builder에서 설정할 것
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    
    //1.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.count
    }
    
    //2.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else {
            print("ERROR")
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .systemGray4
        cell.contentsLabel.text = searchList[indexPath.row]
        
        return cell
    }

}

extension SearchCollectionViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let word = searchBar.text else { return }
        
        searchList.removeAll()
        
        for item in appleProductList {
            if item.contains(word) {
                searchList.append(item)
                print(searchList)
            }
        }
        
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        searchBar.text = ""
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard let word = searchBar.text else { return }
        
        searchList.removeAll()
        
        for item in appleProductList {
            if item.contains(word) {
                searchList.append(item)
                print(searchList)
            }
        }
        
        collectionView.reloadData()
    }
}
