//
//  ArrayTableViewDataSource.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/14/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import UIKit

///A concrete implementation of `TableViewDataSource`. Works with array of models
/// - important: Works with single section only.
class ArrayTableViewDataSource<ItemType, CellType: UpdatableCell>:
TableViewDataSource<ItemType, CellType>, ArrayDataSource {
	public typealias DataSourceItemType = ItemType
	
	// MARK: - Properties
	
	var items: [ItemType]
	
	// MARK: - Initialization
	
	/// Initializes and returns a newly allocated datasource object with the specified `tableView` and `items`.
	/// DataSource use instance of UITableView to perform `reloadData()`
	/// - parameter items: Array of initial datasource's items. Can be empty.
	/// - parameter tableView: Instanse of UITableView to work with.
	init(items: [ItemType], tableView: UITableView) {
		self.items = items
		super.init(tableView)
	}
	
	// MARK: - Public
	
	/// Replace existing `items` array with new one.
	/// - important: Try to perform tableView's `reloadData()`
	public func reload(withItems newItems: [ItemType]) {
		items = newItems
		reloadTableViewData()
	}
	
	/// Add new items to the end of the `items` array.
	/// - parameter newItems: Array of the new items of `ItemType`.
	public func add(items newItems: [ItemType]) {
		items.append(contentsOf: newItems)
		reloadTableViewData()
	}
	
	// MARK: - UITableViewDataSource
	
	public override func numberOfSections(in tableView: UITableView) -> Int {
		return sectionsCount()
	}
	
	public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemsCount(inSection: section)
	}
	
	public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CellType.reuseIdentifier) else {
			fatalError("Cell is absent. It can be cause of invalid reuseIdentifier")
		}
		
		let model = item(at: indexPath)
		cell.tag = indexPath.row
		if let updatableCell = cell as? CellType {
			updatableCell.update(withObject: model)
			cellSetupHandler?(model, updatableCell, indexPath)
		}
		
		return cell
	}
}
