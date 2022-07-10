//
//  ShopController.swift
//  INDChicken
//
//  Created by Mercen on 2022/07/07.
//

import UIKit

public var menuPhotos:[String] = []
public var menuNames:[String] = []
public var menuPrices:[Int] = []
public var menuAmounts:[Int] = []

class ShopController: UIViewController {
    @IBOutlet weak var ShopTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ShopTable.delegate = self
        ShopTable.dataSource = self
    }
}

extension ShopController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuPhotos = []
        menuNames = []
        menuPrices = []
        menuAmounts = []
        
        for i in 0..<5 {
            if shop[i] != 0 {
                menuPhotos.append(photo[i])
                menuNames.append(name[i])
                menuPrices.append(price[i]*shop[i])
                menuAmounts.append(shop[i])
            }
        }
        return menuAmounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let scell = ShopTable.dequeueReusableCell(withIdentifier: "scell", for: indexPath) as! ShopCell
        scell.ShopName.text = menuNames[indexPath.row]
        scell.ShopPrice.text = formatter(number: menuPrices[indexPath.row]) + "원"
        scell.ShopPhoto.image = UIImage(named: menuPhotos[indexPath.row])
        scell.ShopAmount.text = formatter(number: menuAmounts[indexPath.row]) + "개"
        return scell
    }
}
