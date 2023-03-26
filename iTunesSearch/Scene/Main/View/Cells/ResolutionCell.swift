//
//  ResolutionCell.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 24.03.2023.
//

import UIKit

protocol ResolutionCellDelegate: AnyObject {
    func didTappedDetail()
}

final class ResolutionCell: UITableViewCell {
    
    // MARK: - Variables
    static let identifier = "resolutionCell"
    weak var delegate: ResolutionCellDelegate?
    var screenShots: [String] = []
    
    // MARK: - UI Components
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Initialize Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        configureCollectionCell()
    }
    
    private func addViews() {
        self.contentView.addSubview(containerView)
        containerView.addSubviews(titleLabel, collectionView)
    }
    
    private func configureConstraints() {
        containerView.pinToEdgesOf(view: contentView)
        
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor,
                                         constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,
                                          constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        collectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    // MARK: - Delegates
    private func configureCollectionCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    }
    
}

// MARK: - CollectionView Extensions
extension ResolutionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        cell.fillImageCell(screenShotURL: "IMG-924")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
        delegate?.didTappedDetail()
        //        self.selectedIndex = indexPath.item
        //        var categoryId: Int? = 0
        //        self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
        //        self.collectionView.scrollToItem(at: indexPath, at: [.centeredVertically], animated: true)
        //        self.collectionView.reloadData()
        //        switch selectionViewType {
        //        case .main:
        //            delegate?.didTappedSelectedType(typeId: selectedIndex + 1)
        //        case .order:
        //            delegate?.didTappedSelectedType(typeId: selectedIndex + 1)
        //        case .brandProfile:
        //            categoryId = brandListItem?.productCategories?[indexPath.row].id
        //            indexDelegate?.didTapped(indexPath.item)
        //            delegate?.didTappedSelectedType(typeId: categoryId)
        //        case .notification:
        //            delegate?.didTappedSelectedType(typeId: selectedIndex)
        //        case .categoryDetail:
        //            categoryId = productCategory?.items?[indexPath.row].id
        //            delegate?.didTappedSelectedType(typeId: categoryId)
        //        default:
        //            break
        //        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let height = collectionView.frame.height
        //let width = (collectionView.frame.width - 32) / 3
        return CGSize(width: 100, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
}
