//
//  ArticleCell.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 06/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ article: Article) {
        content.text = article.content
    }

}
