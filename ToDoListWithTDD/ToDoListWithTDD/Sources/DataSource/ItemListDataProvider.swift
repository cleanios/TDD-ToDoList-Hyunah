//
//  ItemListDataProvider.swift
//  ToDoListWithTDD
//
//  Created by Hyunah on 22/05/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
