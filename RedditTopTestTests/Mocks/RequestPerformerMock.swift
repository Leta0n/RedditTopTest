//
//  RequestPerformerMock.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation
@testable import RedditTopTest

class RequestPerformerMock: RequestsPerformer {

	var methodWasCalled: Bool = false
	var usedEndpoint: Any?
	
	func performRequest<EndpointType>(from endpoint: EndpointType,
	                    completion: @escaping (Result<EndpointType.Response>) -> Void) where EndpointType : Endpoint {
		methodWasCalled = true
		usedEndpoint = endpoint
	}
}
