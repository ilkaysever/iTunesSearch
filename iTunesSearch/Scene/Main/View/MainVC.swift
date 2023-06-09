//
//  MainVC.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 23.03.2023.
//

import UIKit

final class MainVC: BaseViewController {
    
    // MARK: - Variables
    var viewModel = SearchViewModel()
    //var filteredData = MockData()
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width - 32, height: 0))
    
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = AppColors.backgroundColor
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 0
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let placeholderView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "search_not_found")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Aradığınız kriterlerde sonuç bulunamadı."
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchSearchResults()
        configureTableView()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        tableView.isHidden = true
        placeholderView.isHidden = true
        placeholderLabel.isHidden = true
        addViews()
        configureSearchBar()
        configureConstraints()
    }
    
    private func addViews() {
        view.addSubviews(placeholderView, placeholderLabel, tableView)
    }
    
    private func configureSearchBar() {
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
        searchBar.delegate = self
        
        searchBar.searchTextField.textColor = .white
        searchBar.tintColor = .white
        searchBar.placeholder = "Arama"
    }
    
    private func configureConstraints() {
        tableView.pinToEdgesOf(view: view)
        
        placeholderView.heightAnchor.constraint(equalTo: placeholderView.widthAnchor, multiplier: 1/1).isActive = true
        placeholderView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        placeholderView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -120).isActive = true
        
        placeholderLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                               constant: 32).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: placeholderView.bottomAnchor,
                                              constant: 32).isActive = true
        placeholderLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                                constant: -32).isActive = true
    }
    
    // MARK: - Request
    private func fetchSearchResults(query: String? = nil) {
        viewModel.fetchSearchResults(query: query)
        viewModel.didSuccess = {
            if self.viewModel.searchData?.resultCount ?? 0 > 0 {
                self.tableView.isHidden = false
                self.placeholderView.isHidden = true
                self.placeholderLabel.isHidden = true
            } else {
                self.tableView.isHidden = true
                self.placeholderView.isHidden = false
                self.placeholderLabel.isHidden = false
            }
            self.tableView.reloadData()
            debugPrint(self.viewModel.searchData)
        }
        viewModel.didFailure = { error in
            debugPrint(error)
        }
    }
    
    // MARK: - Functions
    private func openDetailPage(image: UIImage) {
        let vc = DetailVC()
        vc.screenShotImage = image
        let nav = BaseNavigationController(rootViewController: vc)
        nav.modalTransitionStyle = .crossDissolve
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    // MARK: - Delegates
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ResolutionCell.self, forCellReuseIdentifier: ResolutionCell.identifier)
        tableView.reloadData()
    }
    
}

// MARK: - TableView Extensions
extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.searchItem?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResolutionCell.identifier, for: indexPath) as? ResolutionCell else { return UITableViewCell() }
        cell.delegate = self
        let sectionTitle = viewModel.searchItem?[indexPath.section].sectionTitle
        let searchImage = viewModel.searchItem?[indexPath.section].image ?? []
        cell.titleLabel.text = sectionTitle
        cell.searchItem = searchImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = UIScreen.main.bounds.height
        return height / 4
    }
    
}

// MARK: - UISearchBar Extensions
extension MainVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        fetchSearchResults(query: text)
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        searchBar.endEditing(true)
        searchBar.text = nil
        fetchSearchResults(query: text)
        tableView.reloadData()
    }
    
}

// MARK: - Custom Extensions
extension MainVC: ResolutionCellDelegate {
    func didTappedDetail(image: UIImage) {
        openDetailPage(image: image)
    }
}
