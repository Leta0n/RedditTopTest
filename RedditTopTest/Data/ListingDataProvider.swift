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
	var fetchLimit: Int { get }
	func initialFetch(completion: @escaping ([ItemType]) -> Void)
	func fetchMore(completion: @escaping ([ItemType]) -> Void)
}
