//
//  CellProtocol.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/14/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import Foundation

protocol UpdatableCell: Reusable {
	
	/// A type of item which cell is represents
	associatedtype CellModelType
	
	/// Method to configure the cell with internal model type. Should be implemented
	/// - parameter model: model's object to be displayed in a cell
	func update(withModel model: CellModelType)
}

extension UpdatableCell {
	/// Update method to be used outside a cell to configure a cell with unknown model type.
	/// - parameter object: model's object to be displayed in a cell
	func update<T>(withObject object: T) {
		guard let model = object as? CellModelType else { return }
		update(withModel: model)
	}
}
