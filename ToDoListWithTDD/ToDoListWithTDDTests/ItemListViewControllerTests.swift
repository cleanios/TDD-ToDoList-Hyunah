//
//  ItemListViewControllerTests.swift
//  ToDoListWithTDDTests
//
//  Created by Hyunah on 19/05/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import XCTest
@testable import ToDoListWithTDD

class ItemListViewControllerTests: XCTestCase {
    var sut: ItemListViewController?

    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as? ItemListViewController
    }
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        sut?.loadViewIfNeeded()
        XCTAssertNotNil(sut?.tableView)
    }
    
    func test_LoadingView_SetTableViewDataSource() {
        sut?.loadViewIfNeeded()
        XCTAssertTrue(sut?.tableView?.dataSource is ItemListDataProvider)
    }
}
