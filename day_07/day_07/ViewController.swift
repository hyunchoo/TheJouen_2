//
//  ViewController.swift
//  day_07
//
//  Created by 🙈 🙊 on 2021/10/22.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    
    @IBOutlet var myMap: MKMapView!
    let myLoc = CLLocationManager()   //위치정보를 받을 변수
    
    var tt:Timer?
    let ts = #selector(qwer)
    
    @objc func qwer(){ // 1초마다 실행 시킬 함수
        myLoc.startUpdatingLocation() // 내 위치 정보를 받기
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 강화도 시장 37.74734123797736, 126.48725714828556
        // 해운대 35.158699640642055, 129.16041991995834
        // 우리집 37.68105550824821, 127.04870592354851
        
        myLoc.delegate = self   //delegate는 대리인
        
        myLoc.requestWhenInUseAuthorization() // 승인 허용 요청
        
        myMap.showsUserLocation = true  // 지도에 내 위치 보이기 
        
        myMapPaint(37.74734123797736, 126.48725714828556, "강화도")
        
      
        
    }
   
    func myMapPaint(_ lat:CLLocationDegrees, _ lon:CLLocationDegrees, _ title:String){
        //좌표정보
        let cc2d = CLLocationCoordinate2DMake(lat, lon)
 
        //배율
        let zoom = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
       //좌표지역
        let cr = MKCoordinateRegion(
            center: cc2d // 지역 가운데 위치
            , span: zoom) // 축척
        //지도 지역 설정
        myMap.setRegion(cr, animated: true)
        
        let lastLoc = CLLocation(latitude: lat, longitude: lon)
        var addrTT = ""
        
        CLGeocoder().reverseGeocodeLocation(lastLoc, completionHandler: {
                place , _ in
            //위치정보, 에러발생정보
            
            let pp = place!.first!
            
            addrTT = pp.country!   // 국가
            addrTT += " " + pp.locality!  // 시도
            addrTT += " " + pp.thoroughfare!  //  동
            
           
            self.addrLB.text = addrTT
   
        })
       titleLB.text = title
        
        if title != "현위치" {
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
        
        tt?.invalidate()  // 타이머 초기화 (1초마다 현위치 화명 갱신 멈춤)
        tt = nil
        
        print(sender.selectedSegmentIndex)  // 선택한 세그먼트 인덱스 0,1,2
        
        if sender.selectedSegmentIndex == 1 { //해운대 선택
            myMapPaint(35.158699640642055, 129.16041991995834, "해운대")
            //titleLB.text = "해운대"
            //addrLB.text = "부산광역시 중동"
            
        }else if sender.selectedSegmentIndex == 2 { // 우리집 선택
            myMapPaint(37.68105550824821, 127.04870592354851, "우리집")
           // titleLB.text = "우리집"
            //addrLB.text = "서울특별시 도봉구 도봉동 87"
        }else if sender.selectedSegmentIndex == 0 { // 현위치 선택
            
          //  myLoc.startUpdatingLocation() // 내 위치 정보를 받기
          //  self.titleLB.text = "현위치"
            
            tt = Timer.scheduledTimer(timeInterval: 1,
                                      target: self,
                                      selector: ts,
                                      userInfo: nil,
                                      repeats: true)
        }
        
    }
    //myLoc.stopUpdatingLocation() // 내 위치 정보를 받기 이후 자동 실행

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lastLoc = locations.last
        
        let lastLat = (lastLoc?.coordinate.latitude)!
        let lastOn = (lastLoc?.coordinate.longitude)!
        
        print("location maanger 실행 \(lastLat), \(lastOn)")
        myMapPaint(lastLat, lastOn, "현위치") //현재 GPS 를 애플 본사로 해둠
        
        
             
        
      
        
        myLoc.stopUpdatingLocation()  //현재 좌표 갱신 중지
    }
    
}

