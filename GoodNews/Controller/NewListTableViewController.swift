//
//  NewListTableViewController.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation
import UIKit

class NewListTableViewController:UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
