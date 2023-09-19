//
//  HomeCell.swift
//  News
//
//  Created by Apple on 18.09.2023.
//

import UIKit
import SnapKit

class HomeCell: UITableViewCell {
    
    // MARK: - Properties
    
    let newsImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    let titleLbel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        return label
        
    }()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(newsImage)
        newsImage.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.top.equalTo(10)
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }
        
        addSubview(titleLbel)
        titleLbel.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.bottom).offset(5)
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
