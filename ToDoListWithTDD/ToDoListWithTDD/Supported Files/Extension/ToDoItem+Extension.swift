//
//  ToDoItem+Extension.swift
//  ToDoListWithTDD
//
//  Created by Hyunah on 01/05/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import Foundation

extension ToDoItem: Equatable {
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.title == rhs.title &&
            lhs.timeStamp == rhs.timeStamp &&
            lhs.itemDescription == rhs.itemDescription &&
            lhs.location == rhs.location
    }
}
