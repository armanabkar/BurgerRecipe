//
//  RecipeTableViewCell.swift
//  BurgerRecipe
//
//  Created by Arman Abkar on 5/14/21.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 4
    }
}
