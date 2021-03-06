//
//  ViewController.swift
//  day_04
//
//  Created by π π on 2021/10/15.
//

import UIKit

class ViewController: UIViewController,
                      UIPickerViewDelegate,
                      UIPickerViewDataSource {
    let imgs = ["IMG_1876.JPG","IMG_1885.JPG","IMG_1888.JPG","IMG_1893.JPG","IMG_1894.JPG","IMG_1895.JPG","IMG_1899.JPG","IMG_1909.JPG"]
    
    let imgs2 = [
        UIImage(named:"IMG_1876.JPG"),
        UIImage(named:"IMG_1885.JPG"),
        UIImage(named:"IMG_1888.JPG"),
        UIImage(named:"IMG_1893.JPG"),
        UIImage(named:"IMG_1894.JPG"),
        UIImage(named:"IMG_1895.JPG"),
        UIImage(named:"IMG_1899.JPG"),
        UIImage(named:"IMG_1909.JPG")]
    
    
    //pickerView μ μ΄ κ°―μ
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //pickerView μ ν κ°―μ
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imgs.count
    }
    // ν­λͺ© μ€μ  -> λ¬Έμμ΄
  /*  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imgs[row]
    } */
    // ν­λͺ© μ€μ  -> μ΄λ―Έμ§ λ·°
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let res = UIImageView(image: imgs2[row])
        
        res.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return res
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      //  print("ν­λͺ© μ ν \(row)")
        
        selectLB.text = "μ ν: \(imgs[row])"
        
        myImg.image = imgs2[row]
    }
    
    
    
    
    @IBOutlet var selectLB: UILabel!
    
    @IBOutlet var myImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


