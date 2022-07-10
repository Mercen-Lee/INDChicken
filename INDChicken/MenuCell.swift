// MenuCell.swift
// 메뉴판 TableView Cell

import UIKit

class MenuCell: UITableViewCell {
    
    // Table Cell의 내용
    @IBOutlet weak var Photo: UIImageView! // 사진
    @IBOutlet weak var Name: UILabel! // 메뉴명
    @IBOutlet weak var Price: UILabel! // 메뉴 가격
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
