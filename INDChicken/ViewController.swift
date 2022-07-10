//
//  ViewController.swift
//  INDChicken
//
//  Created by Mercen on 2022/07/07.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var MenuTable: UITableView!
    let photo:[String] = ["Fried", "Hot", "Soysause", "Fries", "Cheeseball"]
    let name:[String] = ["후라이드 치킨", "양념 치킨", "간장 치킨", "감자 튀김", "치즈볼"]
    let price:[Int] = [16000, 17000, 17000, 4000, 3000]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.Name.text = name[indexPath.row]
        cell.Price.text = "\(price[indexPath.row])"
        cell.Photo.image = UIImage(named: photo[indexPath.row])
        return cell
    }

    @IBAction func Dismiss(_ segue: UIStoryboardSegue) {}
}

