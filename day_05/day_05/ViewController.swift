//
//  ViewController.swift
//  day_05
//
//  Created by ๐ ๐ on 2021/10/18.
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
         //๊ฒฝ๊ณ ์ฐฝ ์ ์ธ ๋ฐ ์์ฑ
         let alert = UIAlertController(
            title: "์๋ฆผ",
            message: "์ผ์ง์ํ์๋๋ค",
            preferredStyle: UIAlertController.Style.alert)
         
         
         //๊ฒฝ๊ณ ์ฐฝ์ ๋ค์ด๊ฐ ์ก์(๋ฒํผ) ์ฑ์ธ ๋ฐ ์์ฑ
         let ac = UIAlertAction(title: "์๊ฒ ์ต๋๋ค",
                                style: UIAlertAction.Style.default,
                                handler: nil)
         //๊ฒฝ๊ณ ์ฐฝ์ ์ก์์ถ๊ฐ
         alert.addAction(ac)
         // ๊ฒฝ๊ณ ์ฐฝ ์คํ
         present(alert, animated: true, completion: nil)
         
    } else {
        myImg.image = imgOn
        isLamp = true
    }
        
}
    
    func asdf(_aa:UIAlertAction) { //goOff -> offA์ผ๋ ์คํ์ํฌ ํจ์
 // ์ ๊ตฌ๋ฅผ ๋๋ ํจ์๋ก ์ฌ์ฉ
        //   print("์ ๊ตฌ๋ฅผ ๊บผ์")

        myImg.image = imgOff
        isLamp = false
    }
    
    @IBAction func goOff(_ sender: UIButton) {
        if isLamp{
            
            let alert = UIAlertController (title: "์ ๊ตฌ ๋๊ธฐ",
                                           message: "์ ๋ง๋ก ๋๊บผ์ผ??",
                                           preferredStyle: UIAlertController.Style.alert)
            
            present(alert, animated: true, completion: nil)
            
            let cancelA = UIAlertAction(title: "์ํด",
                                        style: UIAlertAction.Style.default,
                                        handler: nil)
            
            let offA = UIAlertAction(title: "๊บผ๋ฒ๋ ค",
                                     style: UIAlertAction.Style.default,
                                     handler: asdf) // handler -> ์ด ๋ฒํผ์ ๋๋ ์๋ ์คํํ  ํจ์ ์ง์  call back ํจ์๋ผ ๋ถ๋ฆ
            alert.addAction(offA)
            alert.addAction(cancelA)
     
            }
        }
        

    @IBAction func goRemove(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "์ ๊ตฌ์ ๊ฑฐ",
                                      message: "์ ๊ตฌ๋ฅผ ์ ๊ฑฐํ์๊ฒ ์ต๋๊น?",
                                      preferredStyle: UIAlertController.Style.alert)
        
        let offA = UIAlertAction(title: "์๋์. ๋๋๋ค",
                                 style: UIAlertAction.Style.default,
                                 handler: asdf)
        
        let onA = UIAlertAction(title: "์๋์. ์ผญ๋๋ค",
                                 style: UIAlertAction.Style.default,
                                handler: { xx in
            self.myImg.image = self.imgOn
            self.isLamp = true
            

        
        }
        )
        
        let reomoveA = UIAlertAction(title: "๋ค, ์ ๊ฑฐํฉ๋๋ค",
                                     style: UIAlertAction.Style.destructive,
                                     handler: { xx in
            //destructive ๋ฅผ ์ฌ์ฉํ๋ฉด ์๋ฎฌ๋ ์ดํฐ์์ ๊ฐ์กฐ ๋๋ค.
            self.myImg.image = self.imgReomve
            self.isLamp = false
            
            
        })
        
        alert.addAction(onA)
        alert.addAction(offA)
        alert.addAction(reomoveA)
        
        
        
        
        present(alert, animated: true, completion: nil)
        
        
        
        
    }

}
