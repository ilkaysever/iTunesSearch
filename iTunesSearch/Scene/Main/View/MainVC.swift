//
//  MainVC.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 23.03.2023.
//

import UIKit

enum Section: Int, CaseIterable {
    case lowResolution
    case mediumResolution
    case heighResolution
    case primeResolution
}

final class MainVC: BaseViewController {
    
    // MARK: - Variables
    var viewModel = SearchViewModel()
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
    
    // MARK: - LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
        configureTableView()
        configureSearchBar()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.addSubview(tableView)
        tableView.backgroundColor = AppColors.backgroundColor
        tableView.pinToEdgesOf(view: view)
    }
    
    private func configureSearchBar() {
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
        searchBar.delegate = self
        
        searchBar.searchTextField.textColor = .white
        searchBar.tintColor = .white
        searchBar.placeholder = "Arama"
    }
    
    // MARK: - Request
    private func setupBinding() {
        DispatchQueue.main.async {
            self.fetchSearchResults()
        }
    }
    
    private func fetchSearchResults() {
        viewModel.fetchSearchResults()
        viewModel.didSuccess = {
            self.tableView.reloadData()
            debugPrint(self.viewModel.searchData)
        }
        viewModel.didFailure = { error in
            debugPrint(error)
        }
    }
    
    // MARK: - Functions
    private func openDetailPage() {
        let vc = DetailVC()
        let nav = BaseNavigationController(rootViewController: vc)
        nav.modalTransitionStyle = .crossDissolve
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    // MARK: - Delegates
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ResolutionCell.self,
                           forCellReuseIdentifier: ResolutionCell.identifier)
        tableView.reloadData()
    }
    
}

// MARK: - TableView Extensions
extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResolutionCell.identifier, for: indexPath) as? ResolutionCell else { return UITableViewCell() }
        cell.delegate = self
        switch Section(rawValue: indexPath.section)! {
        case .lowResolution:
            cell.titleLabel.text = "Düşük Çözünürlük"
        case .mediumResolution:
            cell.titleLabel.text = "Orta Çözünürlük"
        case .heighResolution:
            cell.titleLabel.text = "Yüksek Çözünürlük"
        case .primeResolution:
            cell.titleLabel.text = "Çok Yüksek Çözünürlük"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Section(rawValue: indexPath.section)! {
        case .lowResolution:
            return 200
        case .mediumResolution:
            return 200
        case .heighResolution:
            return 200
        case .primeResolution:
            return 200
        }
    }
    
}

// MARK: - UISearchBar Extensions
extension MainVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        debugPrint(text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        searchBar.endEditing(true)
        searchBar.text = nil
        debugPrint(text)
    }
    
}

// MARK: - Custom Extensions
extension MainVC: ResolutionCellDelegate {
    func didTappedDetail() {
        openDetailPage()
    }
}
