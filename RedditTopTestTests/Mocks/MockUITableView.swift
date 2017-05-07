//
//  MockUITableView.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/17/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import UIKit

final class MockUITableView: UITableView, Mockable {
	
	var expectations: [Expectation] = []
	var rejections: [Expectation] = []
	var resolvers: [Expectation] = []
	var stubs: [String : AnyObject] = [:]
	
	override func reloadData() {
		resolve(expectation: Expectations.reloadData)
	}
	
	override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
		print(#function)
		guard let stub = stubs["\(#function)"] as? UITableViewCell else { return nil }
		return stub
	}
	
	override func beginUpdates() {
		resolve(expectation: Expectations.beginUpdates)
	}
	
	override func endUpdates() {
		resolve(expectation: Expectations.endUpdates)
	}
	
	override func deleteRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
		resolve(expectation: Expectations.deleteRows)
	}
	
	override func insertRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
		resolve(expectation: Expectations.insertRows)
	}
	
	override func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) {
		resolve(expectation: Expectations.moveRow)
	}
	
	override func reloadRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
		resolve(expectation: Expectations.reloadRows)
	}
	
	override func deleteSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
		resolve(expectation: Expectations.deleteSections)
	}
	
	override func insertSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
		resolve(expectation: Expectations.insertSections)
	}
	
	override func reloadSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
		resolve(expectation: Expectations.reloadSections)
	}
}

extension MockUITableView {
	enum Expectations {
		static var reloadData: Expectation { return Expectation("reloadData") }
		static var beginUpdates: Expectation { return Expectation("beginUpdates") }
		static var endUpdates: Expectation { return Expectation("endUpdates") }
		static var deleteRows: Expectation { return Expectation("deleteRows") }
		static var insertRows: Expectation { return Expectation("insertRows") }
		static var moveRow: Expectation { return Expectation("moveRow") }
		static var reloadRows: Expectation { return Expectation("reloadRows") }
		static var deleteSections: Expectation { return Expectation("deleteSections") }
		static var insertSections: Expectation { return Expectation("insertSections") }
		static var reloadSections: Expectation { return Expectation("reloadSections") }
	}
}
