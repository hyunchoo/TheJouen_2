//
//  1. 실행할 함수 정의
//  2. 시간의 흐름을 설정 정의-> 1 에서 정의한 함수 지정
//  3. 프로그램 시작과 함께 2번 정의 객체 호출
//  Created by lee on 2021/10/13.
//

import UIKit

class DateController: UIViewController {
    
    let fmt = DateFormatter()
    
    @IBOutlet var currLB: UILabel!
    
    @IBOutlet var selectLB: UILabel!
    
    var i = 0
    
    //1.번 실행할 Obj 함수 정의
    @objc func asdf(){
        i+=1
        currLB.text = "asdf 실행이여 \(i)"
    }
    
    
    //1.번 실행할 Obj 함수 정의
    @objc func asdf2(){
        
        let now = NSDate() as Date
        
        currLB.text = "현재시간 : " + fmt.string(from: now )
    }
    
    //2. 시간의 흐름을 설정 정의-> 1 에서 정의한 함수 지정
    let ts = #selector(asdf2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
       
        Timer.scheduledTimer(
            timeInterval: 1.0,  //1초 간격
            target: self,        // 자신 객체 --> 현재 앱 화면
            selector: ts,        // 2번으로 선언한 객체
            userInfo: nil,       // 사용자 정보 없음
            repeats: true   )    // 반복유무
        
    }
    

    @IBAction func changeDP(_ sender: UIDatePicker) {
        
        
       
        
        
        print("\(sender.date)")
        print( fmt.string(from: sender.date) )
        
        //selectLB.text = "선택시간 : \(sender.date)"
        
        selectLB.text = "선택시간 : " + fmt.string(from: sender.date)
    }
    
}

