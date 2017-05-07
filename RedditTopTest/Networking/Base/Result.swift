//
//  Result.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

enum Result<Value> {
	case success(value: Value)
	case failure()
}
