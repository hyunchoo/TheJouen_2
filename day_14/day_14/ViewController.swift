//
//  ViewController.swift
//  day_14
//
//  Created by ๐ ๐ on 2021/11/10.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {

    
    @IBOutlet var myImg: UIImageView!
    
    let imgPP = UIImagePickerController()
    
    var imgSave = false // ์ด๋ฏธ์ง ์ ์ฅ ์ ๋ฌด

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imgPP.delegate = self
       // imgPP.mediaTypes = [kUTTypeImage as String]
        
    }

    @IBAction func captureGo(_ sender: UIButton) {
        
        imgSave = true // ์ด๋ฏธ์ง ์ ์ฅ ์ค์ 
        imgPP.sourceType = .camera  //์นด๋ฉ๋ผ์ฑ ์ผ๋ก ์ค์ 
        
        present(imgPP, animated: true, completion: nil)
        
    }
    //  ์นด๋ฉ๋ผ๋ ์ฌ์ง์จ๋ฒ ์ฑ ์ฌ์ฉํ ์๋์คํ
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("imagePickerController() ์๋์คํ")
        
        //์ดฌ์ ์ด๋ฏธ์ง ๊ฐ์ ธ์ค๊ธฐ
        let currImg = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        //Myimg์ ์ด๋ฏธ์ง ๋ณด๊ธฐ
        myImg.image = currImg
        
        
        if imgSave { // ์ ์ฅ ์ค์ ์ด true ์ผ๋๋ง ์ ์ฅ (์ฌ์ง์ดฌ์ ์ผ๋๋ง)
            UIImageWriteToSavedPhotosAlbum(currImg, self, nil, nil)
        }
        
        
        //ํ์ฌ ์ฑ ์ ๊ฑฐ
        self .dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func loadImgGo(_ sender: UIButton) {
        
     imgSave = false  // ์ด๋ฏธ์ง์ ์ฅ ์ํจ์ผ๋ก ์ค์ 
        imgPP.sourceType = .photoLibrary  //
        //
        //์จ๋ฒ ์ฑ ์ด๊ธฐ
        present(imgPP, animated: true, completion: nil)
        
    }
    
    
}


