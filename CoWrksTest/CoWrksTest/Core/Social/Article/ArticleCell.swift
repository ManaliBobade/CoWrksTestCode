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
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var likes: UILabel!

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
        name.text = article.creator?.name
        company.text = article.creator?.company
        likes.isHidden = article.likes.count == 0 ? true : false
        likes.text = article.likes.count == 1 ? "1 Like" : String(format: "%d Likes",article.likes.count)
    }

}
