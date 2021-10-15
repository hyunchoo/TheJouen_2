//
//  ViewController.swift
//  day_02
//
//  Created by 🙈 🙊 on 2021/10/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: UIButton) {
        print("button:", sender.titleLabel!.text!+".JPG")
        myImg.image = UIImage(named: sender.titleLabel!.text!+".JPG")
    
    }
    
}

