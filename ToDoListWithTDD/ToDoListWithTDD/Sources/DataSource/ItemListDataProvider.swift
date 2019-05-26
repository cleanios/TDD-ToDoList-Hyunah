//
//  ItemListDataProvider.swift
//  ToDoListWithTDD
//
//  Created by Hyunah on 22/05/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import UIKit

/// Enum을 추가함으로써 좀 더 명시적이고, default 값을 쓰지 않아도 된다.
enum Section: Int {
    case toDo
    case done
}

class ItemListDataProvider: NSObject, UITableViewDataSource {
    var itemManager: ItemManager?
    
    func tableView(_ rtableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemManager = itemManager else { return 0 }
        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }
        
        switch itemSection {
        case .toDo:
            return itemManager.toDoCount
        case .done:
            return itemManager.doneCount
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemManager = itemManager, let section = Section(rawValue: indexPath.row) else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        let item: ToDoItem
        switch section {
        case .toDo:
            item = itemManager.itemAtIndex(indexPath.row)
        case .done:
            item = itemManager.doneItemAtIndex(indexPath.row)
        }
        cell.configCellWithItem(item: item)
        return cell
    }
}
