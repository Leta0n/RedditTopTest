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
	var thumbnailURL: URL?
	var detailsURL: URL?
	
	func displayableDate() -> String {
		let calendar = Calendar.current
		let components = calendar.dateComponents([.hour, .minute], from: date, to: Date())
		var dateString = "Submitted "
		if let hours = components.hour {
			if hours < 1 {
				dateString = "just now"
			} else {
				dateString = "\(hours) hours ago"
			}
		}
		return dateString
	}
}
