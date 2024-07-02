//
//  ViewController.swift
//  HomeWork3
//
//  Created by Александр Андреев on 01.07.2024.
//

import UIKit

class CalendarDeadlineViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var tableView: UITableView!
    var tableVC: UITableViewController!
    var layout: UICollectionViewFlowLayout!
    var viewModel = CalendarViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.addTopBorderWithColor(color: Resources.uikitColors.cellBorderColor.withAlphaComponent(0.2), width: 1)
        collectionView.addBottomBorderWithColor(color: Resources.uikitColors.cellBorderColor.withAlphaComponent(0.6), width: 2)
    }
    
    func configure() {
        setupView()
        setupCollectionView()
        tableVC = TableViewController(viewModel: viewModel)
        setupTableView()
    }
    
    func setupView() {
        self.navigationController?.navigationBar.barTintColor = UIColor.green
        self.navigationController?.navigationBar.shadowImage = UIImage()
        view.backgroundColor = Resources.uikitColors.backGroundColor
    }
    
}


