//
//  ArrayTableViewDataSource.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/17/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import XCTest
@testable import RedditTopTest

class ArrayTableViewDataSourceTest: XCTestCase {
	
	var dataSource: ArrayTableViewDataSource<NSObject, MockTableViewCell>!
	var tableViewMock: MockUITableView!
	
    override func setUp() {
        super.setUp()
		tableViewMock = MockUITableView()
		dataSource = ArrayTableViewDataSource(items: [NSObject(), NSObject()], tableView: tableViewMock)
		tableViewMock.dataSource = dataSource
    }
	
    override func tearDown() {
        dataSource = nil
		tableViewMock = nil
        super.tearDown()
    }
	
	func testReloadItemsMethodReloadItemsAndPerformTableViewReloadData() {
		tableViewMock.expect(expectation: MockUITableView.Expectations.reloadData)
		
		let newItems = [NSObject(), NSObject(), NSObject()]
		dataSource.reload(withItems: newItems)
		
		XCTAssertEqual(dataSource.items, newItems)
		tableViewMock.verifyAll()
	}
	
	func testAddItemsAndPerformTableReloadData() {
		tableViewMock.expect(expectation: MockUITableView.Expectations.reloadData)
		
		let newItems = [NSObject(), NSObject()]
		dataSource.add(items: newItems)
		
		XCTAssertTrue(dataSource.items.contains(newItems[0]))
		XCTAssertTrue(dataSource.items.contains(newItems[1]))
		tableViewMock.verifyAll()
	}
	
	func testNumberOfRowsInSectionIsEqualToItemsCount() {
		let tableViewItemsCount = tableViewMock.numberOfRows(inSection: 0)
		let datasourceItemsCount = dataSource.items.count
		
		XCTAssertTrue(tableViewItemsCount == datasourceItemsCount)
	}
	
	func testSupscript() {
		XCTAssertNotNil(dataSource[0])
	}
	
	func testSupscriptReturnExpectedObject() {
		let newItems = [NSObject(), NSObject()]
		dataSource.add(items: newItems)
		
		XCTAssertEqual(newItems[1], dataSource[dataSource.itemsCount(inSection: 0) - 1])
	}
	
	func testCellForRowAtIndexPathUpdateCellAfterDequeue() {
		let mockCell = MockTableViewCell()
		mockCell.expect(expectation: MockTableViewCell.updateExpectation)
		
		tableViewMock.stub(method: "dequeueReusableCell(withIdentifier:)", expectedResult: mockCell)
		let _ = dataSource.tableView(tableViewMock, cellForRowAt: IndexPath(row: 0, section: 0))
		
		mockCell.verifyAll()
	}
}
