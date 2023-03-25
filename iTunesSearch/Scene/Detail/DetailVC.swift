//
//  DetailVC.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 25.03.2023.
//

import UIKit

final class DetailVC: BaseViewController {
    
    // MARK: - Variables
    
    // MARK: - UI Components
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image1")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Deneme Title"
        label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descTextView: UITextView = {
        let txtView = UITextView()
        txtView.text = "pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf pfokadjfjafafasfadf"
        txtView.textAlignment = .center
        txtView.textColor = .white
        txtView.backgroundColor = .clear
        txtView.font = UIFont.boldSystemFont(ofSize: 14)
        txtView.translatesAutoresizingMaskIntoConstraints = false
        return txtView
    }()
    
    // MARK: - Life LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = AppColors.backgroundColor
        addNavigationTitle(title: "Deneme Başlık")
        addRightButton(selector: #selector(didTappedDismiss), image: "cross_icon")
        imgView.addCornerRadius(radius: 20)
        addViews()
        configureConstraints()
    }
    
    private func addViews() {
        self.view.addSubviews(imgView, titleLabel, descTextView)
    }
    
    private func configureConstraints() {
        imgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                     constant: 16).isActive = true
        imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor,
                                        multiplier: 3/2).isActive = true
        imgView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                         constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor,
                                        constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                          constant: -16).isActive = true
        
        descTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                           constant: 16).isActive = true
        descTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                          constant: 16).isActive = true
        descTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                            constant: -16).isActive = true
        descTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                             constant: 16).isActive = true
    }
    
}
