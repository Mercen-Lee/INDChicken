// ShopController.swift
// 장바구니 ViewController

import UIKit

// 장바구니 배열
public var menuPhotos:[String] = []
public var menuNames:[String] = []
public var menuPrices:[Int] = []
public var menuAmounts:[Int] = []

class ShopController: UIViewController {
    @IBOutlet weak var NavTitle: UINavigationItem!
    @IBOutlet weak var ShopTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ShopTable.delegate = self
        ShopTable.dataSource = self
    }
}

extension ShopController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 장바구니 새로고침을 위해 장바구니 배열 초기화
        menuPhotos = []
        menuNames = []
        menuPrices = []
        menuAmounts = []
        
        // 장바구니 배열에 선택한 메뉴 추가
        for i in 0..<5 {
            if shop[i] != 0 {
                menuPhotos.append(photo[i])
                menuNames.append(name[i])
                menuPrices.append(price[i] * shop[i])
                menuAmounts.append(shop[i])
            }
        }
        
        // 금액 합계를 포함한 장바구니 타이틀 설정
        NavTitle.title = "장바구니 (\(formatter(number: menuPrices.reduce(0, +)))원)"
        
        // Table 갯수 반환
        return menuAmounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ShopTable.dequeueReusableCell(withIdentifier: "scell", for: indexPath) as! ShopCell
        
        // 장바구니 배열을 장바구니 Table에 할당
        cell.ShopPhoto.image = UIImage(named: menuPhotos[indexPath.row])
        cell.ShopName.text = menuNames[indexPath.row]
        cell.ShopPrice.text = formatter(number: menuPrices[indexPath.row]) + "원"
        cell.ShopAmount.text = formatter(number: menuAmounts[indexPath.row]) + "개"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 장바구니 아이템 스와이프 삭제 시 배열에서 1개 제거 후 새로고침
        if editingStyle == .delete {
            shop[name.firstIndex(of: menuNames[indexPath.row])!] -= 1
            if shop[name.firstIndex(of: menuNames[indexPath.row])!] == 0 {
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else {
                tableView.reloadData()
            }
        }
    }
}
