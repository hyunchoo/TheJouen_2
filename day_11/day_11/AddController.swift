//
//  AddController.swift
//  day_11
//
//  Created by lee on 2021/11/01.
//

import UIKit

class AddController: UIViewController {

    @IBOutlet var addTF: UITextField!
    
    @IBOutlet var imgSG: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addGo(_ sender: Any) {
        
        txtArr.append(addTF.text!)
        imgArr.append(newImgArr[imgSG.selectedSegmentIndex])
        
        navigationController?.popViewController(animated: true) 
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
