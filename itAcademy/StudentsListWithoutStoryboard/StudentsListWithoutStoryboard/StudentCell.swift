//
//  StudentCell.swift
//  StudentsListWithoutStoryboard
//
//  Created by Сергей Матвеенко on 04.12.2021.
//

import UIKit

class StudentCell: UITableViewCell {

    let nameLabel = UILabel()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            setup()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            
            setup()
        }
        
        private func setup() {
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(nameLabel)
            
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
                nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            ])
        }
}
