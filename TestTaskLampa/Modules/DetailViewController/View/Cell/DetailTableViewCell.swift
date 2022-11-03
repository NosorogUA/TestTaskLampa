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
        let descriptionFont = UIFont(name: UISettings.Font.regularFontName, size: 10)
        let dataFont = UIFont(name: UISettings.Font.semiboldFontName, size: 10)
        
        titleTextLabel.font = titleFont
        titleTextLabel.textColor = UISettings.Color.white
        descriptionTextLabel.font = descriptionFont
        descriptionTextLabel.textColor = UISettings.Color.darkGrey
        descriptionTitleTextLabel.font = descriptionLabelFont
        descriptionTitleTextLabel.textColor = UISettings.Color.white
        yearTextLabel.font = dataFont
        yearTextLabel.textColor = UISettings.Color.orange
        ratingTextLabel.font = descriptionLabelFont
        ratingTextLabel.textColor = UISettings.Color.white
    }
    
    func setup(title: String, description: String, year: String, rating: Int, imageUrl: URL?) {
        titleTextLabel.text = title
        descriptionTitleTextLabel.text = "\(Strings.Headers.description):"
        yearTextLabel.text = "\(Strings.Headers.release): \(year)"
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
