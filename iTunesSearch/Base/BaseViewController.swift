//
//  BaseViewController.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 23.03.2023.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        navigationItem.backButtonTitle = ""
        view.backgroundColor = AppColors.backgroundColor
        view.alpha = 1.0
    }
    
    func addNavigationTitle(title: String?) {
        guard let title = title else { return }
        navigationItem.title = title
    }
    
    func addRightButton(selector: Selector?, image: String?)  {
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageview.image = UIImage(named: "\(image ?? "")")
        imageview.contentMode = .center
        imageview.isUserInteractionEnabled = true
        imageview.addCornerRadius(radius: 8)
        imageview.tintColor = .white
        
        let rightButton = UIBarButtonItem(customView: imageview)
        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        navigationItem.rightBarButtonItem = rightButton
        rightButton.customView?.addGestureRecognizer(tapGesture)
    }
    
    func showLoading() {
        let loadingVC = LoadingVC()
        loadingVC.modalPresentationStyle = .overFullScreen
        loadingVC.modalTransitionStyle = .crossDissolve
        self.present(loadingVC, animated: true)
    }
    
    func stopLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dismiss(animated: true)
        }
    }
    
    @objc func didTappedDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

