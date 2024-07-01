//
//  ViewController.swift
//  HomeWork3
//
//  Created by Александр Андреев on 01.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    func setupCollectionView() {
        layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.anch
        view.addSubview(collectionView)
        
        
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = .init(width: 150, height: 150)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        
        layout.minimumInteritemSpacing = 30
        
        layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        if layout.scrollDirection == .horizontal {
            
            layout.headerReferenceSize = .init(width: 100, height: view.frame.height)
        } else {
            layout.headerReferenceSize = .init(width: view.frame.width, height: 60)
        }
        return layout
    }
    
}

