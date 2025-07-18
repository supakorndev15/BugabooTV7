//
//  MiniTopCategoryCollectionViewCell.swift
//  BugabooTV7
//
//  Created by MacDetail on 18/7/2568 BE.
//

import Foundation
import UIKit
import AVKit

class MiniTopCategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properities
    
    static let cellIdentifier = "MiniTopCategoryCollectionViewCell"
    
    var cellData : FoodCategoryModel? {
        didSet {
            guard let cellData = cellData else {
                return
            }
            categoryImgView.image = UIImage(named: cellData.categoryImage)
            categoryLabel.text = cellData.categoryName
        }
    }
    
    lazy var categoryImgView : UIImageView = {
        let catImg = UIImageView()
        
        catImg.translatesAutoresizingMaskIntoConstraints = false
        catImg.contentMode = .scaleAspectFit // .scaleAspectFill
        catImg.clipsToBounds = true
        catImg.layer.cornerRadius = 3
        
        return catImg
    }()
    
    lazy var categoryLabel : UILabel = {
        let catLabel = UILabel()
        catLabel.translatesAutoresizingMaskIntoConstraints = false
        catLabel.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        catLabel.numberOfLines = 2
        catLabel.textAlignment = .center
        catLabel.textColor = .label.withAlphaComponent(0.8)
        return catLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureConstrains()
    }
    
    func configureCell(){
        self.backgroundColor = .clear
        addSubview(categoryImgView)
        addSubview(categoryLabel)
    }
    
    func configureConstrains(){
        NSLayoutConstraint.activate([
            categoryImgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryImgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            categoryImgView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            
            categoryImgView.heightAnchor.constraint(equalToConstant: 60),
            
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 3),
            categoryLabel.topAnchor.constraint(equalTo: categoryImgView.bottomAnchor, constant: 5),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
