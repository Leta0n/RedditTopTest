//
//  PostTableViewCell.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell, UpdatableCell {
	typealias CellModelType = Post
	
	@IBOutlet weak private var titleLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	func update(withModel model: Post) {
		titleLabel.text = model.title
	}
}
