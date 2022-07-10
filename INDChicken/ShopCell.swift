// ShopCell.swift
// 장바구니 TableView Cell

import UIKit

class ShopCell: UITableViewCell {
    
    // Table Cell의 내용
    @IBOutlet weak var ShopPhoto: UIImageView! // 사진
    @IBOutlet weak var ShopName: UILabel! // 메뉴명
    @IBOutlet weak var ShopPrice: UILabel! // 메뉴 가격
    @IBOutlet weak var ShopAmount: UILabel! // 메뉴 수량
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
