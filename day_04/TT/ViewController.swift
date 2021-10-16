//
//  ViewController.swift
//  TT
//
//  Created by 🙈 🙊 on 2021/10/16.
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
    
    
    //pickerView 의 열 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //pickerView 의 행 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imgs.count
    }
    
    
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      //  print("항목 선택 \(row)")
          if component == 0 {
        selctLLB.text = "선택: \(imgs[row])"
          } else {
        myImgg.image = imgs2[row]
    }
}
    
    
    
    @IBOutlet var selctLLB: UILabel!
    
    
    @IBOutlet var myImgg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
