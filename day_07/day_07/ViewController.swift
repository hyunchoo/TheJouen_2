//
//  ViewController.swift
//  day_07
//
//  Created by ๐ ๐ on 2021/10/22.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    
    @IBOutlet var myMap: MKMapView!
    let myLoc = CLLocationManager()   //์์น์ ๋ณด๋ฅผ ๋ฐ์ ๋ณ์
    
    var tt:Timer?
    let ts = #selector(qwer)
    
    @objc func qwer(){ // 1์ด๋ง๋ค ์คํ ์ํฌ ํจ์
        myLoc.startUpdatingLocation() // ๋ด ์์น ์ ๋ณด๋ฅผ ๋ฐ๊ธฐ
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ๊ฐํ๋ ์์ฅ 37.74734123797736, 126.48725714828556
        // ํด์ด๋ 35.158699640642055, 129.16041991995834
        // ์ฐ๋ฆฌ์ง 37.68105550824821, 127.04870592354851
        
        myLoc.delegate = self   //delegate๋ ๋๋ฆฌ์ธ
        
        myLoc.requestWhenInUseAuthorization() // ์น์ธ ํ์ฉ ์์ฒญ
        
        myMap.showsUserLocation = true  // ์ง๋์ ๋ด ์์น ๋ณด์ด๊ธฐ 
        
        myMapPaint(37.74734123797736, 126.48725714828556, "๊ฐํ๋")
        
      
        
    }
   
    func myMapPaint(_ lat:CLLocationDegrees, _ lon:CLLocationDegrees, _ title:String){
        //์ขํ์ ๋ณด
        let cc2d = CLLocationCoordinate2DMake(lat, lon)
 
        //๋ฐฐ์จ
        let zoom = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
       //์ขํ์ง์ญ
        let cr = MKCoordinateRegion(
            center: cc2d // ์ง์ญ ๊ฐ์ด๋ฐ ์์น
            , span: zoom) // ์ถ์ฒ
        //์ง๋ ์ง์ญ ์ค์ 
        myMap.setRegion(cr, animated: true)
        
        let lastLoc = CLLocation(latitude: lat, longitude: lon)
        var addrTT = ""
        
        CLGeocoder().reverseGeocodeLocation(lastLoc, completionHandler: {
                place , _ in
            //์์น์ ๋ณด, ์๋ฌ๋ฐ์์ ๋ณด
            
            let pp = place!.first!
            
            addrTT = pp.country!   // ๊ตญ๊ฐ
            addrTT += " " + pp.locality!  // ์๋
            addrTT += " " + pp.thoroughfare!  //  ๋
            
           
            self.addrLB.text = addrTT
   
        })
       titleLB.text = title
        
        if title != "ํ์์น" {
            setPonit(title: title, subTitle: addrTT, pLoc: cc2d)
        }
       
        
    }
    
    func setPonit(title:String, subTitle:String , pLoc:CLLocationCoordinate2D){
        
        let pin = MKPointAnnotation()
        
        pin.title = title
        pin.subtitle = subTitle
        
        pin.coordinate = pLoc
        
        
        myMap.addAnnotation(pin)
    }
    
    @IBOutlet var titleLB: UILabel!
    
    @IBOutlet var addrLB: UILabel!
    
    
    
    @IBAction func sgChange(_ sender: UISegmentedControl) {
        
        tt?.invalidate()  // ํ์ด๋จธ ์ด๊ธฐํ (1์ด๋ง๋ค ํ์์น ํ๋ช ๊ฐฑ์  ๋ฉ์ถค)
        tt = nil
        
        print(sender.selectedSegmentIndex)  // ์ ํํ ์ธ๊ทธ๋จผํธ ์ธ๋ฑ์ค 0,1,2
        
        if sender.selectedSegmentIndex == 1 { //ํด์ด๋ ์ ํ
            myMapPaint(35.158699640642055, 129.16041991995834, "ํด์ด๋")
            //titleLB.text = "ํด์ด๋"
            //addrLB.text = "๋ถ์ฐ๊ด์ญ์ ์ค๋"
            
        }else if sender.selectedSegmentIndex == 2 { // ์ฐ๋ฆฌ์ง ์ ํ
            myMapPaint(37.68105550824821, 127.04870592354851, "์ฐ๋ฆฌ์ง")
           // titleLB.text = "์ฐ๋ฆฌ์ง"
            //addrLB.text = "์์ธํน๋ณ์ ๋๋ด๊ตฌ ๋๋ด๋ 87"
        }else if sender.selectedSegmentIndex == 0 { // ํ์์น ์ ํ
            
          //  myLoc.startUpdatingLocation() // ๋ด ์์น ์ ๋ณด๋ฅผ ๋ฐ๊ธฐ
          //  self.titleLB.text = "ํ์์น"
            
            tt = Timer.scheduledTimer(timeInterval: 1,
                                      target: self,
                                      selector: ts,
                                      userInfo: nil,
                                      repeats: true)
        }
        
    }
    //myLoc.stopUpdatingLocation() // ๋ด ์์น ์ ๋ณด๋ฅผ ๋ฐ๊ธฐ ์ดํ ์๋ ์คํ

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lastLoc = locations.last
        
        let lastLat = (lastLoc?.coordinate.latitude)!
        let lastOn = (lastLoc?.coordinate.longitude)!
        
        print("location maanger ์คํ \(lastLat), \(lastOn)")
        myMapPaint(lastLat, lastOn, "ํ์์น") //ํ์ฌ GPS ๋ฅผ ์ ํ ๋ณธ์ฌ๋ก ํด๋ 
        
        
             
        
      
        
        myLoc.stopUpdatingLocation()  //ํ์ฌ ์ขํ ๊ฐฑ์  ์ค์ง
    }
    
}

