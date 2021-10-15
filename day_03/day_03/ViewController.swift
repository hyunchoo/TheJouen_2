//
//  1. 실행할 함수 정의
//  2. 시간의 흐름을 설정 정의 -> 1 에서 정의한 함수 지정
//  3. 프로그램 시작과 함께 2번 정의 객체 호출
//  day_03
//
//  Created by 🙈 🙊 on 2021/10/13.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var currLB: UILabel!
    
    @IBOutlet var selectLB: UILabel!
    let fmt = DateFormatter()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        Timer.scheduledTimer(timeInterval: 1.0,   // 1 초간격
    target: self,        // 자신 객체 -->현재 앱 화면
    selector: ts,        // 2번으로 선언한 객체
    userInfo: nil,       // 사용자 정보 없음
    repeats: true)       // 반복 유무

    }
   
    
    
    
  //  let ts = #selector(asdf) //2. 시간의 흐름을 설정 정의 -> 1 에서 정의한 함수 지정
    
    var i = 0
    
    @objc func asdf(){  // //1.번 실행할 OBJ 함수 정의
        i += 1 
        currLB.text = "asdf 실행이여 \(i)"
    }
    
    @objc func asdf2(){  // //1.번 실행할 OBJ 함수 정의

        let now = NSDate() as Date
        currLB.text = "현재시간: " + fmt.string(from: now)
    }
    let ts = #selector(asdf2)

    @IBAction func changeDP(_ sender: UIDatePicker) {
 
        
        print("\(sender.date)")
        print(fmt.string(from: sender.date))
        
      //  selectLB.text = "선택시간 : \(sender.date)"
        
        selectLB.text = "선택시간 : " + fmt.string(from: sender.date)
    }
    
}

