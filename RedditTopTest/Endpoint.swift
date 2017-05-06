//
//  Endpoint.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

protocol Endpoint {
	associatedtype Response: RequestResponse
	var path: String { get }
	var parameters: [String: String] { get }
}

extension Endpoint {
	var parameters: [String: String] { return [:] }
}
