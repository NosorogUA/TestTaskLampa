//
//  FeedTableViewCell.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        reset()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
    
    func setup(title: String, description: String, date: String, imageUrl: URL?) {
        posterImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
        titleLabel.text = title
        descriptionLabel.text = description
        dataLabel.text = date
    }
    
    private func setupUI() {
        posterImageView.layer.cornerRadius = UISettings.Constants.cornerRadius
        posterImageView.clipsToBounds = true
        titleLabel.textColor = UISettings.Color.white
        descriptionLabel.textColor = UISettings.Color.darkGrey
        dataLabel.textColor = UISettings.Color.orange
    }
    
    private func reset() {
        titleLabel.text = nil
        descriptionLabel.text = nil
        posterImageView.image = nil
        dataLabel.text = nil
    }
}
