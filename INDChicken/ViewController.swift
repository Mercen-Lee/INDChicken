// ViewController.swift
// 메뉴판 ViewController

import UIKit

// 메뉴판 배열
public var shop:[Int] = [0, 0, 0, 0, 0] // 장바구니
public let photo:[String] = ["Fried", "Hot", "Soysause", "Fries", "Cheeseball"]
public let name:[String] = ["후라이드 치킨", "양념 치킨", "간장 치킨", "감자 튀김", "치즈 볼"]
public let price:[Int] = [16000, 17000, 17000, 4000, 3000]

// 숫자 포멧 (쉼표 추가) 함수
func formatter(number: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    return numberFormatter.string(from: NSNumber(value: number))!
}

class ViewController: UIViewController {
    @IBOutlet weak var MenuTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuTable.delegate = self
        MenuTable.dataSource = self
    }
    
    // 장바구니 닫기 버튼
    @IBAction func Dismiss(_ segue: UIStoryboardSegue) {}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Table 갯수 반환
        return 5;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 메뉴판 배열을 메뉴판 Table에 할당
        let cell = MenuTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.Photo.image = UIImage(named: photo[indexPath.row])
        cell.Name.text = name[indexPath.row]
        cell.Price.text = formatter(number: price[indexPath.row]) + "원"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 장바구니 이동 얼럿
        let alert = UIAlertController(title: "추가 완료", message: "장바구니로 이동하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let closeAction = UIAlertAction(title: "닫기", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "이동", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "Shop")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        
        // 얼럿 열기
        alert.addAction(closeAction)
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        shop[indexPath.row] += 1
    }
}
