//
//  TableViewCell.swift
//  AutoFlexibleRowHeight
//
//  Created by 寺家 篤史 on 2019/04/11.
//  Copyright © 2019 Yumemi Inc. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class TableViewCell: UITableViewCell {
    struct Item {
        let title: String?
        let date: String?
        let description: String?
        let imageUrl: URL?
    }
    let stackView = UIStackView()
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let descriptionLabel = UILabel()
    let bottomSeparatorView = UIView()
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    var isThumbnailHidden: Bool {
        get {
            return thumbnailImageView.isHidden
        }
        set {
            thumbnailImageView.isHidden = newValue
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        contentView.addSubview(stackView)
        
        thumbnailImageView.borderColor = .red
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        stackView.addArrangedSubview(thumbnailImageView)
        
        titleLabel.borderColor = .orange
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        stackView.addArrangedSubview(titleLabel)
        
        dateLabel.borderColor = .purple
        dateLabel.font = UIFont.systemFont(ofSize: 11)
        dateLabel.textColor = .lightGray
        dateLabel.numberOfLines = 1
        stackView.addArrangedSubview(dateLabel)
        
        descriptionLabel.borderColor = .cyan
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 3
        stackView.addArrangedSubview(descriptionLabel)
        
        bottomSeparatorView.backgroundColor = .lightGray
        contentView.addSubview(bottomSeparatorView)
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(insets)
        }
        thumbnailImageView.snp.makeConstraints { (make) in
            make.width.equalTo(stackView.snp.width)
            // 16 : 9 and hidden priority
            make.height.equalTo(stackView.snp.width).multipliedBy(0.5625).priority(UILayoutPriority.defaultLow.rawValue)
        }
        bottomSeparatorView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(insets)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
        thumbnailImageView.isHidden = false
        titleLabel.isHidden = false
        dateLabel.isHidden = false
        descriptionLabel.isHidden = false
    }
    
    func configure(with item: Item) {
        thumbnailImageView.kf.setImage(with: item.imageUrl)
        isThumbnailHidden = item.imageUrl == nil
        titleLabel.text = item.title
        titleLabel.isHidden = item.title == nil
        dateLabel.text = item.date
        dateLabel.isHidden = item.date == nil
        descriptionLabel.text = item.description
        descriptionLabel.isHidden = item.description == nil
    }
}

extension UIView {
    var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        }
        set {
            #if DEBUG
            return
            #endif
            if let borderColor = newValue {
                layer.borderColor = borderColor.cgColor
                layer.borderWidth = layer.borderWidth == 0 ? 1 : layer.borderWidth
            } else {
                layer.borderColor = nil
            }
        }
    }
}
