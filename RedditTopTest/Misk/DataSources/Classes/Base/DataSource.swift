//
//  DataSource.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/14/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import Foundation

/// Base DataSource type
protocol DataSource {
	/// Object's type associated with concrete datasource
	associatedtype DataSourceItemType
	
	/// Number of sections
	/// - returns: The number of section
	func sectionsCount() -> Int
	
	/// Number of items in section
	/// - parameter section: A section index for sectioned data
	/// - returns: The number of objects in section.
	func itemsCount(inSection section: Int) -> Int
	
	/// Returns `DataSourceItemType`'s objects by `indexPath`
	/// - parameter indexPath: An index path locating a item in dataSource.
	/// - returns: An object of `DataSourceItemType` located be given `indexPath`
	func item(at indexPath: IndexPath) -> DataSourceItemType
}
