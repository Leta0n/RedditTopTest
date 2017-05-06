//
//  ArrayDataSource.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/14/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import Foundation

protocol ArrayDataSource: DataSource {
	
	/// Items container
	var items: [DataSourceItemType] { get }
	
	subscript(index: Int) -> DataSourceItemType { get }
}

/// Default implementation of `ArrayDataSource`
extension ArrayDataSource {
	
	subscript(index: Int) -> DataSourceItemType {
		return self.items[index]
	}
	
	func sectionsCount() -> Int {
		return 1
	}
	
	func itemsCount(inSection section: Int) -> Int {
		return items.count
	}
	
	func item(at indexPath: IndexPath) -> DataSourceItemType {
		return items[indexPath.row]
	}
}
