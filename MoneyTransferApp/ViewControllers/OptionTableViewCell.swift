//
//  OptionTableViewCell.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
    let optionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let optionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    let checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "checkmark")
        imageView.isHidden = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(optionImageView)
        addSubview(optionLabel)
        addSubview(checkmarkImageView)
        
        optionImageView.translatesAutoresizingMaskIntoConstraints = false
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            optionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            optionImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            optionImageView.widthAnchor.constraint(equalToConstant: 40),
            optionImageView.heightAnchor.constraint(equalToConstant: 40),
            
            optionLabel.leadingAnchor.constraint(equalTo: optionImageView.trailingAnchor, constant: 16),
            optionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            checkmarkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            checkmarkImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 20),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with option: Option, isSelected: Bool) {
        optionImageView.image = UIImage(named: option.imageName)
        optionLabel.text = option.title
        checkmarkImageView.isHidden = !isSelected
    }
}
