//
//  ViewController.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate {
	
	// MARK: - IBOutlets
	@IBOutlet weak private var tableView: UITableView!
	
	// MARK: - Properties
	
	var paginationInfo = PaginationInfo(limit: 15, offset: 0)
	
	// MARK: - Dependencies
	var postsProvider: PostsProvider!
	var flowController: FeedFlowController!
	var dataSource: ArrayTableViewDataSource<Post, PostTableViewCell>!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupDataSource()
		setupTableView()
		postsProvider.dataArray(with: paginationInfo) { [weak self] posts in
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
		tableView.delegate = self
	}
	
	// MARK: - UITableViewDelegate
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let post = dataSource[indexPath.row]
		flowController.postSelected(post)
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if indexPath.row == dataSource.itemsCount(inSection: 0) - 1 {
			print("should load")
		}
	}
}
