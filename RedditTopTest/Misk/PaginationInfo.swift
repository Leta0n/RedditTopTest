//
//  PaginationInfo.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

struct PaginationInfo {
	let limit: Int
	var offset: Int
	var totalItems: Int { return limit + offset }
	
	mutating func incrementPage() {
		offset = offset + limit
	}
}
