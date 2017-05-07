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
	@IBOutlet weak private var comemntsLabel: UILabel!
	@IBOutlet weak private var dateLabel: UILabel!
	@IBOutlet weak private var authorLabel: UILabel!
	@IBOutlet weak private var previewImageView: UIImageView!

	override func prepareForReuse() {
		previewImageView.image = nil
	}
	
	func update(withModel model: Post) {
		titleLabel.text = model.title
		comemntsLabel.text = "\(model.commentsAmount) comments"
		dateLabel.text = model.displayableDate()
		authorLabel.text = "by \(model.author)"
		if let url = model.thumbnailURL {
			previewImageView.setImage(from: url)
		}
	}
	
	func updateImage(_ image: UIImage) {
		previewImageView.image = image
	}
}
