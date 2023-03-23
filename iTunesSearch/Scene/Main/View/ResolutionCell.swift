//
//  ResolutionCell.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 24.03.2023.
//

import UIKit

class ResolutionCell: UITableViewCell {
    
    static let identifier = "resolutionCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "pfokadjfjafafasfadf"
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
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
//    var productCategory: CategoryResponseModel? {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
    
//    var brandListItem: BrandListItem? {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
    
//    var selectionViewType: SegmentCellType? {
//        didSet {
//            setupUI()
//        }
//    }
//
//    var segmentValue = ""
//    var mainTitle = ["all".localized, "popular".localized, "new".localized]
//    var orderTitle = ["ongoing_orders".localized, "completed_orders".localized]
//    var notificationUserTitle = ["all_of".localized, "orders".localized, "my_campaigns".localized]
//    var notificationBrandTitle = ["all_of".localized, "demands_title".localized, "my_campaigns".localized]
//
//    var selectedIndex = 0
//    weak var delegate: SelectionViewDelegate?
//    weak var indexDelegate: SelectionViewIndexDelegate?

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        setupUI()
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.backgroundColor = AppColors.backgroundColor
//        switch selectionViewType {
//        case.notification:
//            topLineView.isHidden = false
//        default:
//            topLineView.isHidden = true
//        }
        addViews()
        configureConstraints()
        //configureCollectionCell()
    }
    
    private func addViews() {
        self.contentView.addSubview(containerView)
        containerView.addSubviews(titleLabel, collectionView)
    }
    
//    func setSelected(_ index: Int) {
//        selectedIndex = index
//    }
    
    private func configureConstraints() {
        containerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        collectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    private func configureCollectionCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.register(SelectionCollectionCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ResolutionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
//        switch selectionViewType {
//        case .main:
//            return mainTitle.count
//        case .brandProfile:
//            return brandListItem?.productCategories?.count ?? 0
//        case .order:
//            return orderTitle.count
//        case .notification:
//            return notificationUserTitle.count
//        case .categoryDetail:
//            return productCategory?.items?.count ?? 0
//        default:
//            return 0
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SelectionCollectionCell.self), for: indexPath) as? SelectionCollectionCell else { return UICollectionViewCell() }
//        switch selectionViewType {
//        case .main:
//            segmentValue = mainTitle[indexPath.row]
//            cell.bottomLineView.isHidden = true
//        case .brandProfile:
//            segmentValue = brandListItem?.productCategories?[indexPath.row].name ?? ""
//        case .order:
//            segmentValue = orderTitle[indexPath.row]
//        case .notification:
//            if UserManager.shared.userType == 1 {
//                segmentValue = notificationUserTitle[indexPath.row]
//            } else if UserManager.shared.userType == 2 {
//                segmentValue = notificationBrandTitle[indexPath.row]
//            }
//        case .categoryDetail:
//            segmentValue = productCategory?.items?[indexPath.row].name ?? ""
//        default:
//            break
//        }
//        cell.titleLabel.text = segmentValue
//
//        if selectedIndex == indexPath.item {
//            cell.bottomLineView.isHidden = false
//            cell.titleLabel.font = AppFonts.SfProDisplayRegular16
//            cell.titleLabel.textColor = AppColors.primaryDark
//        } else {
//            cell.bottomLineView.isHidden = true
//            cell.titleLabel.textColor = AppColors.primaryDark70
//            cell.titleLabel.font = AppFonts.SfProDisplayRegular14
//        }
        let cell = UICollectionViewCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
//        let label = UILabel(frame: CGRect.zero)
//        let height = collectionView.frame.height
//        switch selectionViewType {
//        case .main:
//            let width = (collectionView.frame.width - 32) / 3
//            return CGSize(width: width, height: height)
//        case .brandProfile:
//            segmentValue = brandListItem?.productCategories?[indexPath.row].name ?? ""
//        case .order:
//            segmentValue = orderTitle[indexPath.row]
//        case .notification:
//            let width = (collectionView.frame.width - 32) / 3
//            return CGSize(width: width, height: height)
//        case .categoryDetail:
//            segmentValue = productCategory?.items?[indexPath.row].name ?? ""
//        default:
//            break
//        }
//        label.text =  segmentValue
//        label.sizeToFit()
//        return CGSize(width: label.frame.width, height: height)
        
        //        let label = UILabel(frame: CGRect.zero)
        //        let height = collectionView.frame.height
        //        let width = (collectionView.frame.width - 32) / 3
                return CGSize(width: 300, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
}
