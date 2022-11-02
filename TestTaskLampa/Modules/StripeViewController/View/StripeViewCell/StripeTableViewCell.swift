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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reset()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
    
    func setup(title: String, description: String, imageUrl: URL?) {
        print("try to show cell: \(title)")
       // posterImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    private func reset() {
        titleLabel.text = nil
        descriptionLabel.text = nil
        posterImageView.image = nil
    }
}
