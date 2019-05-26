//
//  ItemListViewController.swift
//  ToDoListWithTDD
//
//  Created by Hyunah on 21/04/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//
import UIKit
import Foundation

class ItemListViewController: UIViewController {
    
    static let identifier = "ItemListViewController"
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: ItemListDataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
    }
}

