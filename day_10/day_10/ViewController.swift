//
//  ViewController.swift
//  day_10
//
//  Created by π π on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myLB: UILabel!
    
    @IBOutlet var myImg: UIImageView!
    
    let lampArr = [true:UIImage(named: "lamp_on.png"),
                  false:UIImage(named: "lamp_off.png")]
    
    var lampData =  true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func backGo( _ editView:EditController){
        print("ViewController backgo() μ€ν")
        myLB.text = editView.editTF.text
        lampData = editView.lampSw.isOn
        myImg.image = lampArr[lampData] as! UIImage
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue λ²νΌ μ€ν ")
        
      let editView = segue.destination as! EditController
        
        
//     editView.txtData = "λ©μΈμμ λ³΄λ"
//  editView.swData = false
        
        editView.txtData = myLB.text!
        
        editView.swData = lampData
        
        editView.mainCon = self
        
    }
    
    
}

