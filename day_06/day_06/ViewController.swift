//
//  ViewController.swift
//  day_06
//
//  Created by lee on 2021/10/20.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var urlTxT: UITextField!
    
    
    @IBOutlet var myWeb: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strToWeb("https://m.nate.com")
    
        
    }
    
    func strToWeb(_ addr:String){
        let url = URL(string: addr)!
        let req = URLRequest(url: url)
        
        myWeb.load(req)
        
        urlTxT.text = addr
    }
    
    
    @IBAction func urlGo(_ sender: UIButton) {
        
        strToWeb(urlTxT.text!)
    }
    
    @IBAction func naverGo(_ sender: UIButton) {
        
        strToWeb("https://m.naver.com")
    }
    
    @IBAction func googleGo(_ sender: UIButton) {
        
        strToWeb("https://www.google.com")
    }
    
    @IBAction func stringGo(_ sender: UIButton) {
        
        let ttt = "<html><head><meta charset='UTF-8'>" +
        "</head><body><h1>와 문자열이다</h1>" +
            "<p>문서 내용 입니다 <br> 우헬헬헬</p>" +
            "<a href='https://cafe.naver.com/jx007s'>강사까페로 이동 </a>" +
             "</body></html>"
        
        myWeb.loadHTMLString(ttt, baseURL: nil)
        
        urlTxT.text = "문자열"
        
    }
    
    @IBAction func fileGo(_ sender: UIButton) {
        
        let fPath = Bundle.main.path(forResource: "aaa", ofType: "html")
        let url = URL(fileURLWithPath: fPath!)
        let req = URLRequest(url: url)
        
        myWeb.load(req)
        
        urlTxT.text = "파일"
    }
    
    @IBAction func stopGo(_ sender: Any) {
        myWeb.stopLoading()
    }
    
    @IBAction func refreshGo(_ sender: Any) {
        myWeb.reload()
    }
    
    @IBAction func backGo(_ sender: Any) {
        
        myWeb.goBack()
        urlTxT.text = "\(myWeb.url!)"
    }
    
    @IBAction func nextGo(_ sender: Any) {
        myWeb.goForward()
        urlTxT.text = "\(myWeb.url!)"
    }
    
    
}

