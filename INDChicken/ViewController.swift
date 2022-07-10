//
//  ViewController.swift
//  INDChicken
//
//  Created by Mercen on 2022/07/07.
//

import UIKit

class ViewController: UIViewController {
    let photo:[String] = ["Fried", "Hot", "Soysause", "Fries", "Cheeseball"]
    let name:[String] = ["후라이드 치킨", "양념 치킨", "간장 치킨", "감자 튀김", "치즈볼"]
    let price:[Int] = [16000, 17000, 17000, 4000, 3000]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Dismiss(_ segue: UIStoryboardSegue) {}
}

