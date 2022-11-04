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
    @IBOutlet private weak var playButton: UIButton!
    
    private let gradientLayer = CAGradientLayer()
    var buttonHandler: (() -> Void)?
    
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
        posterImageView.layer.cornerRadius = UISettings.Constants.cornerRadius
        posterImageView.clipsToBounds = true
        titleTextLabel.textColor = UISettings.Color.white
        ratingTextLabel.textColor = UISettings.Color.white
    }
    
    func setup(title: String,  rating: Float, imageUrl: URL?) {
        titleTextLabel.text = title
        ratingTextLabel.text = String(format: "%.1f", rating)
        posterImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground)
        starImageView.image = UIImage(named: "star")
    }
    
    private func reset() {
        titleTextLabel.text = nil
        ratingTextLabel.text = nil
        posterImageView.image = nil
    }
    
    @IBAction func playButtonAction(_ sender: Any) {
        // show alert
        buttonHandler?()
    }
}
