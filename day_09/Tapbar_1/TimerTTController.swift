//
//  ViewController.swift
//  TimerTT
//
//  Created by lee on 2021/10/13.
//

import UIKit

class TimerTTController: UIViewController {
    
    
    
    @IBOutlet var timeLB: UITextField!
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @objc func zxcv(){
        i-=1
    /*    if i<0 {
            i=0
        }
*///. i 가 0 일 경우 tt의 실행을 중단시킨다.
        
        timeLB.text = "\(i)"
        if i <= 0 {
        tt?.invalidate()  //초기화
        tt = nil
        
            let alert = UIAlertController(title: "알림",
                                          message: "무궁화 꽃이 피었습니다",
                                          preferredStyle: UIAlertController.Style.alert)
            
            let ac = UIAlertAction(title: "탈락입니다",
                                   style: UIAlertAction.Style.default,
                                   handler: nil)
            
            alert.addAction(ac)
            
            present(alert, animated: true)
    }
}
    let ts = #selector(zxcv)
    
    var tt:Timer?  // Timer를 받을 멤버변수
    
    @IBAction func btnGo(_ sender: UIButton) {
        i = Int(timeLB.text!)!
        
        
        if i <= 0{
            let alert = UIAlertController(title: "시작 불가",
                                          message: "시간 설정이 0 입니다.",
                                          preferredStyle: UIAlertController.Style.alert)
            
            let ac = UIAlertAction(title: "알겠습니다.",
                                   style: UIAlertAction.Style.default,
                                   handler: nil)
            
            alert.addAction(ac)
            
            present(alert, animated: true)
        }
        tt = Timer.scheduledTimer(timeInterval: 1,
                             target: self,
                             selector: ts,
                             userInfo: nil,
                             repeats: true)
        

        
    }
    
  
    
    
    
    
}

