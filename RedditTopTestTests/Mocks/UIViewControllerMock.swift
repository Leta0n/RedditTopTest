//
//  UIViewControllerMock.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import UIKit

class UIViewControllerMock: UIViewController {
	
	var presentedViceController: UIViewController?
	
	override func present(_ viewControllerToPresent: UIViewController,
	                      animated flag: Bool, completion: (() -> Void)? = nil) {
		presentedViceController = viewControllerToPresent
	}
}
