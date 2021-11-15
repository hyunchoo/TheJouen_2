//
//  ViewController.swift
//  fileTT
//
//  Created by 🙈 🙊 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var myTF: UITextField!
    
    
    @IBOutlet var myTXT: UITextView!
    
    var filePath = ""
    var filemgr:FileManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        filePath = NSHomeDirectory()+"/Documents/qqwwee.txt"
        print("경로:\(filePath)")
        
         filemgr = FileManager.default
        
        if !filemgr.fileExists(atPath: filePath){
            print("파일생성")
            let data = "다리에 독이 있는 장수풍뎅이".data(using: String.Encoding.utf8)
        
        filemgr.createFile(atPath: filePath, contents: data, attributes: nil)
        }else{
            print("파일생성안함")
        }
    }

    @IBAction func goSave(_ sender: UIButton) {
        let ttt = myTF.text!
        let data = ttt.data(using: String.Encoding.utf8)
        filemgr.createFile(atPath: filePath, contents: data, attributes: nil)
    }
    
    @IBAction func goRead(_ sender: UIButton) {
        let fh = FileHandle(forReadingAtPath: filePath)
        
        let data = (fh?.readDataToEndOfFile())!
        
        let ttt = String(data: data, encoding: String.Encoding.utf8)
        print(ttt)
        myTXT.text = ttt
        fh?.closeFile()
    }
    
    @IBAction func goAppend(_ sender: UIButton) {
        let ttt = myTF.text!
        let fh = FileHandle(forUpdatingAtPath: filePath)
        let data = ttt.data(using: String.Encoding.utf8)
        fh?.seekToEndOfFile()
        fh?.write(data!)
        fh?.closeFile()
    }
}

