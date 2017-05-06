//
//  ViewController.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
	
	// MARK: - IBOutlets
	@IBOutlet weak private var tableView: UITableView!
	
	// MARK: - Dependencies
	var feedService: FeedService!
	var dataSource: ArrayTableViewDataSource<Post, PostTableViewCell>!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupDataSource()
		setupTableView()
		feedService.fetchPosts { [weak self] posts in
			guard let strongSelf = self else { return }
			strongSelf.dataSource.reload(withItems: posts)
		}
	}
	
	func setupDataSource() {
		dataSource = ArrayTableViewDataSource(items: [], tableView: tableView)
	}
	
	func setupTableView() {
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 100
		tableView.tableFooterView = UIView(frame: CGRect.zero)
		tableView.dataSource = dataSource
	}
}
