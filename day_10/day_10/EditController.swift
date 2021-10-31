//
//  EditController.swift
//  day_10
//
//  Created by 🙈 🙊 on 2021/10/29.
//

import UIKit

class EditController: UIViewController {

    var txtData = ""
    var swData = true
    var mainCon:ViewController?
    
    @IBOutlet var editTF: UITextField!
    
    
    @IBOutlet var lampSw: UISwitch!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Edit viewDidLoad() 실행: \(txtData), \(swData)")
        
        editTF.text = txtData
        lampSw.isOn = swData
        
        
        
    }
    
    @IBAction func mainGo(_ sender: UIButton) {
        
        mainCon?.backGo(self)
        
        navigationController?.popViewController(animated: true)  // 현재 열려진 창 닫기
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
