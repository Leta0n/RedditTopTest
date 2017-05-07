//
//  ListingDataProvider.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

protocol ListingDataProvider {
	associatedtype ItemType
	func dataArray(with pagination: PaginationInfo, completion: @escaping ([ItemType]) -> Void)
}
