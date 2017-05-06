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
	
	func application(_ application: UIApplication,
	                 didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		setupNetworking(application)
		return true
	}
	
	// MARK: - Private
	
	private func setupNetworking(_ application: UIApplication) {
		guard let url = URL(string: "https://www.reddit.com") else { fatalError() }
		let networkSession = NetworkSession(URLSession.shared, baseServerURL: url)
		let feedService = FeedService(networkSession)
		if let rootVC = window?.rootViewController as? FeedViewController {
			rootVC.feedService = feedService
		}
	}
}
