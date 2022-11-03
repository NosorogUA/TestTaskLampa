//
//  StripeTableViewCell.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import UIKit

class StripeTableViewCell: UITableViewCell {

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
        print("try to show cell: \(title)")
        posterImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
        titleLabel.text = title
        descriptionLabel.text = description
        dataLabel.text = date
    }
    
    private func setupUI() {
        let titleFont = UIFont(name: UISettings.Font.boldFontName, size: 14)
        let descriptionFont = UIFont(name: UISettings.Font.regularFontName, size: 10)
        let dataFont = UIFont(name: UISettings.Font.semiboldFontName, size: 10)
        
        titleLabel.font = titleFont
        titleLabel.textColor = UISettings.Color.white
        descriptionLabel.font = descriptionFont
        descriptionLabel.textColor = UISettings.Color.darkGrey
        dataLabel.font = dataFont
        dataLabel.textColor = UISettings.Color.orange
    }
    
    private func reset() {
        titleLabel.text = nil
        descriptionLabel.text = nil
        posterImageView.image = nil
    }
}
