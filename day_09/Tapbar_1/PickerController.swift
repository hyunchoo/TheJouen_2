//
//  ViewController.swift
//  pickerWeb
//
//  Created by 🙈 🙊 on 2021/10/21.
//

import UIKit
import WebKit

class PickerController: UIViewController,
                      UIPickerViewDelegate,
                      UIPickerViewDataSource {
    
    typealias TU = (name:String, url:String)
    
    let arr:[TU] = [
        ("구글","https://www.google.com"),
        ("네이트","https://m.nate.com"),
        ("네이버","https://m.naver.com"),
        ("다음","https://m.daum.net")
    ]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    
 func pickerView(_ pickerView: UIPickerView, titleForRow row :Int, forComponent component: Int) -> String? {
        return arr[row].name
    }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        strToWeb(arr[row].url)
    }
    
    func strToWeb(_ addr:String){
        let url = URL(string: addr)!
        let req = URLRequest(url: url)
        
        myWeb.load(req)
    }
   

    @IBOutlet var myWeb: WKWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

