//
//  ViewController.swift
//  fileTT
//
//  Created by π π on 2021/11/10.
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
        print("κ²½λ‘:\(filePath)")
        
         filemgr = FileManager.default
        
        if !filemgr.fileExists(atPath: filePath){
            print("νμΌμμ±")
            let data = "λ€λ¦¬μ λμ΄ μλ μ₯μνλμ΄".data(using: String.Encoding.utf8)
        
        filemgr.createFile(atPath: filePath, contents: data, attributes: nil)
        }else{
            print("νμΌμμ±μν¨")
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

