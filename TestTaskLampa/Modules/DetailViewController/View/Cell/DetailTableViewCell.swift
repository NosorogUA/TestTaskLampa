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
    @IBOutlet private weak var ratingTextLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var starImageView: UIImageView!
    
    private let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupGradient()
        reset()
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)
        gradientLayer.frame = posterImageView.bounds
    }
          
    private func setupGradient() {
        let colorSet = [ UIColor.clear, UIColor.black ]
        let location = [0.0, 0.6]
        posterImageView.addGradient(with: gradientLayer, gradientFrame: posterImageView.frame, colorSet: colorSet, locations: location)
    }
    
    private func setupUI() {
        let titleFont = UIFont(name: UISettings.Font.boldFontName, size: 14)
        let descriptionLabelFont = UIFont(name: UISettings.Font.semiboldFontName, size: 12)
        
        titleTextLabel.font = titleFont
        titleTextLabel.textColor = UISettings.Color.white
        ratingTextLabel.font = descriptionLabelFont
        ratingTextLabel.textColor = UISettings.Color.white
    }
    
    func setup(title: String,  rating: Float, imageUrl: URL?) {
        titleTextLabel.text = title
        ratingTextLabel.text = String(format: "%.1f", rating)
        posterImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground)
        starImageView.image = UIImage(systemName: "star.fill")
    }
    
    private func reset() {
        titleTextLabel.text = nil
        ratingTextLabel.text = nil
        posterImageView.image = nil
    }
}
