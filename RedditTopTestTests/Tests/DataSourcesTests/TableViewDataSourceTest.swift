//
//  ArrayTableViewDataSourceTest.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/17/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import XCTest
@testable import RedditTopTest

class TableViewDataSourceTest: XCTestCase {
	
	var dataSource: TableViewDataSource<NSObject, MockTableViewCell>!
	var tableViewMock: MockUITableView!
    
    override func setUp() {
        super.setUp()
		tableViewMock = MockUITableView()
        dataSource = TableViewDataSource(tableViewMock)
		
		tableViewMock.dataSource = dataSource
    }
    
    override func tearDown() {
        dataSource = nil
		tableViewMock = nil
        super.tearDown()
    }
    
	func testReloadDataPerformTableViewsReloadData() {
		tableViewMock.expect(expectation: MockUITableView.Expectations.reloadData)
		
		dataSource.reloadTableViewData()
		
		tableViewMock.verifyAll()
	}
	
	func testRetainCycleIsAbsent() {
		tableViewMock = nil
		
		XCTAssertNil(tableViewMock)
		XCTAssertNotNil(dataSource)
	}
}
