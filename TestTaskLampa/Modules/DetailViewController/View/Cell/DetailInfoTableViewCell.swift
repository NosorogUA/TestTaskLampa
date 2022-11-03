//
//  DetailInfoTableViewCell.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 03.11.2022.
//

import UIKit

class DetailInfoTableViewCell: UITableViewCell {

    @IBOutlet private weak var descriptionTextLabel: UILabel!
    @IBOutlet private weak var descriptionTitleTextLabel: UILabel!
    @IBOutlet private weak var yearTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        reset()
    }
    
    private func setupUI() {
        let descriptionLabelFont = UIFont(name: UISettings.Font.semiboldFontName, size: 12)
        let descriptionFont = UIFont(name: UISettings.Font.regularFontName, size: 10)
        let dataFont = UIFont(name: UISettings.Font.semiboldFontName, size: 10)
        
        descriptionTextLabel.font = descriptionFont
        descriptionTextLabel.textColor = UISettings.Color.darkGrey
        descriptionTitleTextLabel.font = descriptionLabelFont
        descriptionTitleTextLabel.textColor = UISettings.Color.white
        yearTextLabel.font = dataFont
        yearTextLabel.textColor = UISettings.Color.orange
    }
    
    func setup(description: String, year: String) {
        
        descriptionTitleTextLabel.text = "\(Strings.Headers.description):"
        yearTextLabel.text = "\(Strings.Headers.release): \(year)"
        descriptionTextLabel.text = description
        
    }
    
    private func reset() {
        descriptionTitleTextLabel.text = nil
        yearTextLabel.text = nil
        descriptionTextLabel.text = nil
    }
    
}
