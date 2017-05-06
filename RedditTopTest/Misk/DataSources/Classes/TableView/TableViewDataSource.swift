//
//  TableViewDataSource.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/16/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import UIKit

///Base concrete implementation of UITableViewDataSource.
///Hold weak reference to the `tableView`.
class TableViewDataSource<ItemType, CellType: UpdatableCell>: NSObject, UITableViewDataSource {
	
	// MARK: - Properties
	
	/// UITableView instance associated with instance of datasource
	weak var tableView: UITableView?
	
	/// This method should be used for more specific cell setup.
	/// DataSource try to call this method for each cell in `cellForRowAt indexPath`
	var cellSetupHandler: ((ItemType, CellType, IndexPath) -> Void)?
	
	// MARK: - Initialization
	
	/// Initializes and returns a newly allocated datasource object with the specified `tableView`.
	init(_ tableView: UITableView) {
		self.tableView = tableView
	}
	
	// MARK: - Public
	
	///Perform `reloadData()` of `tableView` if it isn't nil
	func reloadTableViewData() {
        tableView?.reloadData()
	}
	
	// MARK: - UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        fatalError("Should be overridden")
    }
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		fatalError("Should be overridden")
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		fatalError("Should be overridden")
	}
}
