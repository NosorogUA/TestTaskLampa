//
//  DetailTableViewCell.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 26.10.2022.
//

import UIKit
import SDWebImage

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleTextLabel: UILabel!
    @IBOutlet private weak var yearTextLabel: UILabel!
    @IBOutlet private weak var ratingTextLabel: UILabel!
    @IBOutlet private weak var descriptionTextLabel: UILabel!
    @IBOutlet private weak var descriptionTitleTextLabel: UILabel!
     
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet weak var starImageView: UIImageView!
    
    private let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setupGradient()
        reset()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = posterImageView.bounds
    }
    
//    private func setupGradient() {
//        let colorSet = [ UIColor.red, UIColor.black ]
//        let location = [0.0, 0.3]
//        posterImageView.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
//    }
    
    
    func setup(title: String, description: String, year: String, rating: Float, imageUrl: URL?) {
        
        titleTextLabel.text = title
        descriptionTitleTextLabel.text = "\(Strings.Headers.description):"
        yearTextLabel.text = "\(Strings.Headers.year): \(year)"
        ratingTextLabel.text = "\(rating.formatted())"
        descriptionTextLabel.text = description
        posterImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground)
        starImageView.image = UIImage(systemName: "star.fill")
    }
    
    private func reset() {
        titleTextLabel.text = nil
        descriptionTitleTextLabel.text = nil
        yearTextLabel.text = nil
        ratingTextLabel.text = nil
        descriptionTextLabel.text = nil
        posterImageView.image = nil
    }
}
