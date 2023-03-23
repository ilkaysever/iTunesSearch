//
//  MainVC.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 23.03.2023.
//

import UIKit

class MainVC: BaseViewController {

    @IBOutlet weak var contiunueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        let vc = DenemeVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}

