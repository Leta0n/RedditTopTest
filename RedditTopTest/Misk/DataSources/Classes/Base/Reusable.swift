//
//  Reusable.swift
//  Ecoisme
//
//  Created by Glib Pavliuchenko on 11/15/16.
//  Copyright © 2016 Ecoisme. All rights reserved.
//

import Foundation

protocol Reusable: class {
	static var reuseIdentifier: String { get }
}

extension Reusable {
	static var reuseIdentifier: String {
		return String(describing: Self.self)
	}
}
