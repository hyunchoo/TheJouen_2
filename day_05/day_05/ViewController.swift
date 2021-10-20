//
//  ViewController.swift
//  day_05
//
//  Created by 🙈 🙊 on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var myImg: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgReomve = UIImage(named: "lamp_remove.png")
    
    var isLamp = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goOn(_ sender: UIButton) {
   
    
     if isLamp {
         //경고창 선언 및 생성
         let alert = UIAlertController(
            title: "알림",
            message: "켜진상태입니다",
            preferredStyle: UIAlertController.Style.alert)
         
         
         //경고창에 들어갈 액션(버튼) 성언 및 생성
         let ac = UIAlertAction(title: "알겠습니다",
                                style: UIAlertAction.Style.default,
                                handler: nil)
         //경고창에 액션추가
         alert.addAction(ac)
         // 경고창 실행
         present(alert, animated: true, completion: nil)
         
    } else {
        myImg.image = imgOn
        isLamp = true
    }
        
}
    
    func asdf(_aa:UIAlertAction) { //goOff -> offA일때 실행시킬 함수
 // 전구를 끄는 함수로 사용
        //   print("전구를 꺼요")

        myImg.image = imgOff
        isLamp = false
    }
    
    @IBAction func goOff(_ sender: UIButton) {
        if isLamp{
            
            let alert = UIAlertController (title: "전구 끄기",
                                           message: "정말로 끌꺼야??",
                                           preferredStyle: UIAlertController.Style.alert)
            
            present(alert, animated: true, completion: nil)
            
            let cancelA = UIAlertAction(title: "안해",
                                        style: UIAlertAction.Style.default,
                                        handler: nil)
            
            let offA = UIAlertAction(title: "꺼버려",
                                     style: UIAlertAction.Style.default,
                                     handler: asdf) // handler -> 이 버튼을 눌렀을때 실행할 함수 지정 call back 함수라 부름
            alert.addAction(offA)
            alert.addAction(cancelA)
     
            }
        }
        

    @IBAction func goRemove(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "전구제거",
                                      message: "전구를 제거하시겠습니까?",
                                      preferredStyle: UIAlertController.Style.alert)
        
        let offA = UIAlertAction(title: "아니요. 끕니다",
                                 style: UIAlertAction.Style.default,
                                 handler: asdf)
        
        let onA = UIAlertAction(title: "아니요. 켭니다",
                                 style: UIAlertAction.Style.default,
                                handler: { xx in
            self.myImg.image = self.imgOn
            self.isLamp = true
            

        
        }
        )
        
        let reomoveA = UIAlertAction(title: "네, 제거합니다",
                                     style: UIAlertAction.Style.destructive,
                                     handler: { xx in
            //destructive 를 사용하면 시뮬레이터에서 강조 된다.
            self.myImg.image = self.imgReomve
            self.isLamp = false
            
            
        })
        
        alert.addAction(onA)
        alert.addAction(offA)
        alert.addAction(reomoveA)
        
        
        
        
        present(alert, animated: true, completion: nil)
        
        
        
        
    }

}
