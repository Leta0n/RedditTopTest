//
//  ArrayDataSourceTest.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/30/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import XCTest
@testable import RedditTopTest

final class ArrayDataSourceImplementation: ArrayDataSource {
	typealias DataSourceItemType = NSObject
	var items: [NSObject] = []
}

class ArrayDataSourceTest: XCTestCase {
	
	var dataSource: ArrayDataSourceImplementation!
	
    override func setUp() {
        super.setUp()
		dataSource = ArrayDataSourceImplementation()
	}
    
    override func tearDown() {
		dataSource = nil
		super.tearDown()
    }
    
    func testDefaultSubscript() {
		let item = NSObject()
		dataSource.items.append(item)
		
		XCTAssertEqual(dataSource[0], item)
    }
	
	func testItemsCount() {
		dataSource.items.append(contentsOf: [NSObject(), NSObject()])
		XCTAssertEqual(dataSource.itemsCount(inSection: 0), 2)
	}
	
	func testDefaultSectionCount() {
		XCTAssertEqual(dataSource.sectionsCount(), 1)
	}
	
	func testItemAtIndexPath() {
		let item = NSObject()
		let item1 = NSObject()
		dataSource.items.append(item)
		dataSource.items.append(item1)
		
		XCTAssertEqual(dataSource.item(at: IndexPath(row: 1, section: 0)), item1)
	}
}
