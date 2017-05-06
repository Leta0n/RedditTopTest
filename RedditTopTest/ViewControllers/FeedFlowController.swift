//
//  FeedFlowController.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import UIKit
import SafariServices

class FeedFlowController {
	private weak var targetViewController: UIViewController?
	
	init(_ viewControoler: FeedViewController) {
		targetViewController = viewControoler
	}
	
	func postSelected(_ post: Post) {
		guard let url = post.detailsURL else { return }
		let safariViewController = SFSafariViewController(url: url)
		targetViewController?.present(safariViewController, animated: true, completion: nil)
	}
}
