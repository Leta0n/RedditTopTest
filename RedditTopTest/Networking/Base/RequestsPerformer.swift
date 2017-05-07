//
//  RequestsPerformer.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

protocol RequestsPerformer {
	func performRequest<EndpointType: Endpoint>(from endpoint: EndpointType,
	                    completion: @escaping (Result<EndpointType.Response>) -> Void)
}
