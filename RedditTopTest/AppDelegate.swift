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
		let session = setupNetworking(application)
		setupRootViewController(with: session)
		setupImageLoader()
		return true
	}
	
	// MARK: - Private
	
	private func setupNetworking(_ application: UIApplication) -> NetworkSession {
		guard let url = URL(string: "https://www.reddit.com") else { fatalError() }
		return NetworkSession(URLSession.shared, baseServerURL: url)
	}
	
	private func setupRootViewController(with networkSession: NetworkSession) {
		let feedService = FeedService(networkSession)
		if let rootViewController = window?.rootViewController as? FeedViewController {
			rootViewController.postsProvider = PostsProvider(feedService, fetchLimit: 15)
			let flowController = FeedFlowController(rootViewController)
			rootViewController.flowController = flowController
		}
	}
	
	private func setupImageLoader() {
		let queue = DispatchQueue(label: "ImageLoading", attributes: .concurrent)
		let cache = NSCache<NSURL, UIImage>()
		cache.name = "ImageCache"
		cache.countLimit = 50
		let imageLoader = ImageLoader(queue, cache: cache)
		ImageLoader.sharedLoader = imageLoader
	}
}
