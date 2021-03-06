//
//  ViewController.swift
//  AudioTT
//
//  Created by ๐ ๐ on 2021/11/05.
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
    
    var aUrl:URL!  // ์์๊ฒฝ๋ก
    
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
           // return "์๊ฐ"
           let mm = Int(time/60)
            let ss = Int(time)%60
            return "\(mm) : \(ss)"
    
    }

    @IBAction func goPlay(_ sender: UIButton) {
        
        if currTimer == nil {
            do {
                aPlayer = try AVAudioPlayer(contentsOf: currUrl)
                aPlayer.delegate = self //  ํ๋์ด์ด ์์
                aPlayer.volume = 1 // ๋ณผ๋ฅจ๊ฐ ์ด๊ธฐํ , storyboard์ UIslider   ๊ฐ๊ณผ ์ผ์น
                
            } catch let e as NSError {
                print("์ ๋ฌ๋ฐ์:\(e)")
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
        print("๋ธ๋๋")
        
        currTimer.invalidate()
    }
    
    
    var aRecorder:AVAudioRecorder!  // ๋น์ ์ ์ด
    
    var rUrl:URL!
    @IBAction func recordGO(_ sender: UIButton) {
        if sender.titleLabel!.text == "๋น์"{
            
            sender.setTitle("๋น์์ค์ง", for: UIControl.State())
            
            //ํ์ฌ ์ฑ์ ํ์ผ ๊ฒฝ๋ก
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
                print("๋น์ ์ค์ ์๋ฌ ์๋ฌ๋ฐ์ : \(e)")
            }
            aRecorder.delegate = self
            
            let session = AVAudioSession.sharedInstance()
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                try session.setCategory(AVAudioSession.Category.playAndRecord)
                try session.setActive(true)
               
            } catch let e as NSError {
                print("๋น์ ์ฐ๊ฒฐ์๋ฌ ์๋ฌ๋ฐ์ : \(e)")
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
            
            sender.setTitle("๋น์", for: UIControl.State())
        }
        
        
    }
    
    
    @IBAction func soundChange(_ sender: UISwitch) {
        
        if sender.isOn{ //๋น์ํ์ผ
            
            currUrl = rUrl
            
        }else{//์ฌ์ํ์ผ
            
            currUrl = aUrl
        }
        
        
        
    }
    
    
}

