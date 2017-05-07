//
//  MockTableViewCell.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/22/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import UIKit
@testable import RedditTopTest

final class MockTableViewCell: UITableViewCell, UpdatableCell, Mockable {
	typealias CellModelType = NSObject
	
	var expectations: [Expectation] = []
	var rejections: [Expectation] = []
	var resolvers: [Expectation] = []
	var stubs: [String : AnyObject] = [:]
	
	func update(withModel model: NSObject) {
		resolve(expectation: MockTableViewCell.updateExpectation)
	}
	
	// MARK: - Default Expectations
	
	static var updateExpectation: Expectation {
		return Expectation("update")
	}
}

final class MockCollectionViewCell: UICollectionViewCell, UpdatableCell, Mockable {
	typealias CellModelType = NSObject
	
	var expectations: [Expectation] = []
	var rejections: [Expectation] = []
	var resolvers: [Expectation] = []
	var stubs: [String : AnyObject] = [:]
	
	func update(withModel model: NSObject) {
		resolve(expectation: MockTableViewCell.updateExpectation)
	}
	
	// MARK: - Default Expectations
	
	static var updateExpectation: Expectation {
		return Expectation("update")
	}
}
