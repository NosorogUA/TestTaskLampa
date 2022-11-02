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
     
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var posterImageView: UIImageView!
    
    private let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackground()
        setupGradient()
        reset()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = posterImageView.bounds
    }
    
    private func setupGradient() {
        let colorSet = [ UIColor.red, UIColor.black ]
        let location = [0.0, 0.3]
        posterImageView.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
    }
    
    private func setupBackground() {
        backgroundImageView.layer.cornerRadius = 10
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.borderColor = UIColor.gray.cgColor
        backgroundImageView.layer.borderWidth = 1
    }
    
    func setup(title: String, description: String, language: String, year: String, rating: Float, imageUrl: URL?) {
        
        titleTextLabel.text = title
        languageTextLabel.text = "\(Strings.Headers.language): \(language)"
        yearTextLabel.text = "\(Strings.Headers.year): \(year)"
        ratingTextLabel.text = "\(Strings.Headers.rating): \(rating)"
        descriptionTextLabel.text = description
        posterImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground) 
    }
    
    private func reset() {
        titleTextLabel.text = nil
        languageTextLabel.text = nil
        yearTextLabel.text = nil
        languageTextLabel.text = nil
        ratingTextLabel.text = nil
        descriptionTextLabel.text = nil
        posterImageView.image = nil
    }
}
