//
//  ViewController.swift
//  INDChicken
//
//  Created by Mercen on 2022/07/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MenuTable: UITableView!
    let photo:[String] = ["Fried", "Hot", "Soysause", "Fries", "Cheeseball"]
    let name:[String] = ["후라이드 치킨", "양념 치킨", "간장 치킨", "감자 튀김", "치즈볼"]
    let price:[Int] = [16000, 17000, 17000, 4000, 3000]
    public var shop:[Int] = [0, 0, 0, 0, 0]
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuTable.delegate = self
        MenuTable.dataSource = self
    }
    @IBAction func Dismiss(_ segue: UIStoryboardSegue) {}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func formatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.Name.text = name[indexPath.row]
        cell.Price.text = formatter(number: price[indexPath.row]) + "원"
        cell.Photo.image = UIImage(named: photo[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "추가 완료", message: "장바구니로 이동하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let closeAction = UIAlertAction(title: "닫기", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "이동", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "Shop")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        alert.addAction(closeAction)
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        shop[indexPath.row] += 1
    }
}
