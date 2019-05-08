//
//  ItemManager.swift
//  ToDoListWithTDD
//
//  Created by Hyunah on 29/04/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import Foundation

class ItemManager {
    // MARK: - properties
    var toDoCount: Int {
        return todoItems.count
    }
    var doneCount: Int {
        return doneItems.count
    }
    private var todoItems = [ToDoItem]()
    private var doneItems = [ToDoItem]()
    
    // MARK: - initializer
    init() {}
    
    // MARK: - Managing Item
    func addItem(_ item: ToDoItem) {
        guard !todoItems.contains(item) else { return }
        todoItems.append(item)
    }
    
    func itemAtIndex(_ index: Int) -> ToDoItem {
        return todoItems[index]
    }
    
    func checkItemAtIndex(_ index: Int) {
        let item = todoItems[index]
        doneItems.append(item)
        todoItems.remove(at: index)
    }
    
    func doneItemAtIndex(_ index: Int) -> ToDoItem {
        return doneItems[index]
    }
    
    func removeAllItems() {
        todoItems.removeAll()
        doneItems.removeAll()
    }
}
