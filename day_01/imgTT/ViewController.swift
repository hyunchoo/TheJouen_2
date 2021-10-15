//
//  ViewController.swift
//  imgTT
//
//  Created by lee on 2021/10/06.
//

import UIKit

class ViewController: UIViewController {

    let lamps:[Bool:UIImage] = [
        true:UIImage(named: "lamp_on.png") as! UIImage,
        false:UIImage(named: "lamp_off.png") as! UIImage
    ]
    
    @IBOutlet var myImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //var ii = UIImage(named: "lamp_off.png")
        
        //myImg.image = ii
        //myImg.image = lamps[true]
    }
    
    
    
    @IBAction func zoomGo(_ sender: UIButton) {
        
        var ww = myImg.frame.width
        var hh = myImg.frame.height
        
        print("눌렀다", ww, hh)
        if sender.titleLabel!.text! == "확대"{
           //myImg.frame.size = CGSize(width: 800, height: 1000)
            myImg.frame.size = CGSize(width: ww * 2, height: hh * 2)
           sender.setTitle("축소", for: .normal)
        }else{
            //myImg.frame.size = CGSize(width: 400, height: 500)
            myImg.frame.size = CGSize(width: ww / 2, height: hh / 2)
            sender.setTitle("확대", for: .normal)
            
        }
    }
    
    
    @IBAction func onOffGo(_ sender: UISwitch) {
        print(sender.isOn)
        
        
        myImg.image = lamps[sender.isOn]
    }
    

}

