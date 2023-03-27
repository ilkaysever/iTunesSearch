//
//  DetailVC.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 25.03.2023.
//

import UIKit

final class DetailVC: BaseViewController {
    
    // MARK: - Variables
    var screenShotImage: UIImage? {
        didSet {
            imgView.image = screenShotImage
        }
    }
    
    // MARK: - UI Components
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Life LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = AppColors.backgroundColor
        //self.view.alpha = 0.5
        //addNavigationTitle(title: "Deneme Başlık")
        addRightButton(selector: #selector(didTappedDismiss), image: "cross_icon")
        imgView.addCornerRadius(radius: 20)
        addViews()
        configureConstraints()
    }
    
    private func addViews() {
        self.view.addSubviews(imgView)
    }
    
    private func configureConstraints() {
        imgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        imgView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        imgView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        imgView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
        //imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor, multiplier: 2/3).isActive = true
    }
    
}
