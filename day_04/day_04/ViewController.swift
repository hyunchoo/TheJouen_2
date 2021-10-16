//
//  ViewController.swift
//  day_04
//
//  Created by 🙈 🙊 on 2021/10/15.
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
    // 항목 설정 -> 문자열
  /*  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imgs[row]
    } */
    // 항목 설정 -> 이미지 뷰
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let res = UIImageView(image: imgs2[row])
        
        res.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return res
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      //  print("항목 선택 \(row)")
        
        selectLB.text = "선택: \(imgs[row])"
        
        myImg.image = imgs2[row]
    }
    
    
    
    
    @IBOutlet var selectLB: UILabel!
    
    @IBOutlet var myImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


