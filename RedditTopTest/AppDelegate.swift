//
//  AppDelegate.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var postsService: PostsService!

	func application(_ application: UIApplication,
	                 didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		setupNetworking()
		return true
	}
	
	// MARK: - Private
	
	private func setupNetworking() {
		guard let url = URL(string: "https://www.reddit.com") else { fatalError() }
		let networkSession = NetworkSession(URLSession.shared, baseServerURL: url)
		postsService = PostsService(networkSession)
		postsService.fetchPosts()
	}
}
