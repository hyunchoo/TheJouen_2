//
//  ViewController.swift
//  day_16
//
//  Created by ð ð on 2021/11/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTF: UITextField!
    
    @IBOutlet var ageTF: UITextField!
    
    @IBOutlet var telTF: UITextField!
    
    
    var dbpath = ""
    var fmr:FileManager!
    
    
    @IBOutlet var myTXT: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbpath = NSHomeDirectory()+"/Document/test.db"
        
        fmr = FileManager.default
        
        if !fmr.fileExists(atPath: dbpath) {
            
            let database:FMDatabase? = FMDatabase(path:dbpath)
            
            let sql = "create table member (pname text , age integer, tel text )"
            
            if let db = database {
                db.open()
                
                db.executeStatements(sql)
                
                db.close()
                print("Table ìì± ì±ê³µ")
            } else {
                print("DBê°ì²´ ìì± ì¤í¨")
            }
            listShow()
        }
     
    }
    func listShow(){
        let database:FMDatabase? = FMDatabase(path:dbpath)
        let sql = "select *  from member"
        
        database?.open()
        
       let res = database?.executeQuery(sql, withArgumentsIn: [])
        
        var ttt = ""
        
        while res!.next(){
            ttt += "\(res!.string(forColumn:"Pname")!),"
            + "\(res!.int(forColumn:"age")),"
            + "\(res!.string(forColumn:"tel")!) \n"
        }
        myTXT.text = ttt
        
        database?.close()
    }
    @IBAction func goInsert(_ sender: Any) {
        let database:FMDatabase? = FMDatabase(path:dbpath)
        
        let sql = "insert into member (pname, age, tel) values('aaa', 20, '1234')"
        
        database?.open()
        
        database?.executeUpdate(sql, withArgumentsIn: [])
        
        database?.close()
        
        listShow()
    }
    
    @IBAction func goUpdate(_ sender: Any) {
        
    }
    
    @IBAction func goDelete(_ sender: Any) {
        
    }
    
    
    
}

