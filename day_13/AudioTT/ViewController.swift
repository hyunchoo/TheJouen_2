//
//  ViewController.swift
//  AudioTT
//
//  Created by 🙈 🙊 on 2021/11/05.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,
                      AVAudioPlayerDelegate,
                      AVAudioRecorderDelegate {

    @IBOutlet var myProgress: UIProgressView!
    
    @IBOutlet var currLB: UILabel!
    
    @IBOutlet var endLB: UILabel!
    
    @IBOutlet var statusLB: UILabel!
    
    @IBOutlet var recordLB: UILabel!
    
    var currUrl:URL!
    
    var aUrl:URL!  // 음원경로
    
    var aPlayer:AVAudioPlayer!
    
    var currTimer:Timer!
    
    let playSelector = #selector(updateTime)
    
    let recSelector = #selector(updateRecTime)
    
    @objc func updateTime() {
        currLB.text = secToSte( aPlayer.currentTime)
        myProgress.progress = Float(aPlayer.currentTime) / Float(aPlayer.duration)
    }
    
    @objc func updateRecTime(){
        recordLB.text = secToSte(aRecorder.currentTime)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aUrl = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        currUrl = aUrl
       
        
    }
        
        func secToSte(_ time:TimeInterval)->String {
           // return "시간"
           let mm = Int(time/60)
            let ss = Int(time)%60
            return "\(mm) : \(ss)"
    
    }

    @IBAction func goPlay(_ sender: UIButton) {
        
        if currTimer == nil {
            do {
                aPlayer = try AVAudioPlayer(contentsOf: currUrl)
                aPlayer.delegate = self //  플래이어 위임
                aPlayer.volume = 1 // 볼륨값 초기화 , storyboard의 UIslider   값과 일치
                
            } catch let e as NSError {
                print("애러발생:\(e)")
            }
        
       
        
        endLB.text = secToSte( aPlayer.duration)
        
        currTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                         target: self,
                                         selector: playSelector,
                                         userInfo: nil,
                                         repeats: true)
        }
        aPlayer.play()
        
    }
    
    
    @IBAction func goPause(_ sender: UIButton) {
        
        aPlayer.pause()
    }
    
    
    @IBAction func goStop(_ sender: UIButton) {
        if currTimer != nil {
            
        aPlayer.stop()
        aPlayer.currentTime = 0
        currTimer.invalidate()
        updateTime()
    }
    currTimer = nil
        
    }
    
    
    
    
    
    @IBAction func volumeChange(_ sender: UISlider) {
        aPlayer.volume = sender.value
        currTimer.invalidate()
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("노래끝")
        
        currTimer.invalidate()
    }
    
    
    var aRecorder:AVAudioRecorder!  // 녹음 제어
    
    var rUrl:URL!
    @IBAction func recordGO(_ sender: UIButton) {
        if sender.titleLabel!.text == "녹음"{
            
            sender.setTitle("녹음중지", for: UIControl.State())
            
            //현재 앱의 파일 경로
            let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

            rUrl = dir.appendingPathComponent("aaaa.m4a")
            
            let recSetting = [
                AVFormatIDKey:NSNumber(value: kAudioFormatAppleLossless),
                AVEncoderAudioQualityKey:AVAudioQuality.max.rawValue,
                AVEncoderBitRateKey:320000,
                AVNumberOfChannelsKey:2,
                AVSampleRateKey:44100.0
            ] as [String:Any]

            do {
                aRecorder = try AVAudioRecorder(url: rUrl, settings: recSetting)
            } catch let e as NSError {
                print("녹음 설정에러 에러발생 : \(e)")
            }
            aRecorder.delegate = self
            
            let session = AVAudioSession.sharedInstance()
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                try session.setCategory(AVAudioSession.Category.playAndRecord)
                try session.setActive(true)
               
            } catch let e as NSError {
                print("녹음 연결에러 에러발생 : \(e)")
            }
            
            aRecorder.record()
            
            currTimer = Timer.scheduledTimer(
                timeInterval: 0.1,
                target: self,
                selector: recSelector,
                userInfo: nil,
                repeats: true)
            
        }else{
            
            if currTimer != nil {
                currTimer.invalidate()
                aRecorder.stop()
                currTimer = nil
            }
            
            sender.setTitle("녹음", for: UIControl.State())
        }
        
        
    }
    
    
    @IBAction func soundChange(_ sender: UISwitch) {
        
        if sender.isOn{ //녹음파일
            
            currUrl = rUrl
            
        }else{//재생파일
            
            currUrl = aUrl
        }
        
        
        
    }
    
    
}

