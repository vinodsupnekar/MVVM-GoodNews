//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!

    func configure(_ viewModel: ArticleViewModel) {
        self.titleLable.text = viewModel.title
        self.descriptionLable.text = viewModel.description
    }
}
