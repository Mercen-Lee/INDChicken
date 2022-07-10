//
//  ShopCell.swift
//  INDChicken
//
//  Created by Mercen on 2022/07/10.
//

import UIKit

class ShopCell: UITableViewCell {
    @IBOutlet weak var ShopPhoto: UIImageView!
    @IBOutlet weak var ShopName: UILabel!
    @IBOutlet weak var ShopAmount: UILabel!
    @IBOutlet weak var ShopPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
