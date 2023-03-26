//
//  ImageCollectionViewCell.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 24.03.2023.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier = "imageCollectionCell"
    
    // MARK: - UI Components
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imagesView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.addCornerRadius(radius: 8)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Initialize Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.contentView.backgroundColor = AppColors.backgroundColor
        addViews()
        configureConstraints()
    }
    
    private func addViews() {
        self.contentView.addSubview(containerView)
        containerView.addSubviews(imagesView)
    }
    
    private func configureConstraints() {
        containerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        imagesView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        imagesView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        imagesView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imagesView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    func fillImageCell(screenShotURL: String?) {
        imagesView.image = UIImage(named: screenShotURL ?? "")
        //imagesView.setImageUrl(imageUrl: screenShotURL ?? "")
    }
    
}
