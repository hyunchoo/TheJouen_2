//
//  ViewController.swift
//  day_14
//
//  Created by 🙈 🙊 on 2021/11/10.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {

    
    @IBOutlet var myImg: UIImageView!
    
    let imgPP = UIImagePickerController()
    
    var imgSave = false // 이미지 저장 유무

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imgPP.delegate = self
       // imgPP.mediaTypes = [kUTTypeImage as String]
        
    }

    @IBAction func captureGo(_ sender: UIButton) {
        
        imgSave = true // 이미지 저장 설정
        imgPP.sourceType = .camera  //카메라앱 으로 설정
        
        present(imgPP, animated: true, completion: nil)
        
    }
    //  카메라나 사진앨범 앱 사용후 자동실행
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("imagePickerController() 자동실행")
        
        //촬영 이미지 가져오기
        let currImg = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        //Myimg에 이미지 보기
        myImg.image = currImg
        
        
        if imgSave { // 저장 설정이 true 일때만 저장 (사진촬영 일때만)
            UIImageWriteToSavedPhotosAlbum(currImg, self, nil, nil)
        }
        
        
        //현재 앱 제거
        self .dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func loadImgGo(_ sender: UIButton) {
        
     imgSave = false  // 이미지저장 안함으로 설정
        imgPP.sourceType = .photoLibrary  //
        //
        //앨범 앱 열기
        present(imgPP, animated: true, completion: nil)
        
    }
    
    
}


