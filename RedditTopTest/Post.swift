//
//  Post.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

struct Post {
	let title: String
	let author: String
	let date: Date
	let commentsAmount: Int
	let thumbnailURL: URL?
	let imageURL: URL?
}
