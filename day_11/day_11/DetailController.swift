//
//  DetailController.swift
//  day_11
//
//  Created by lee on 2021/11/01.
//

import UIKit

class DetailController: UIViewController {
    
    var ttt = -1
    
    
   
    @IBOutlet var detailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("ttt: \(ttt)")
        detailTF.text = txtArr[ttt]
    }
    
    
    
    
    @IBAction func updateGO(_ sender: Any) {
        
        txtArr[ttt] = detailTF.text! 
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
