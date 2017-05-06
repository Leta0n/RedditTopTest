//
//  ViewController.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
	
	@IBOutlet weak private var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()
	}
	
	func setupTableView() {
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 100
		tableView.tableFooterView = UIView(frame: CGRect.zero)
	}
}
