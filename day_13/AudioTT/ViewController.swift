//
//  ViewController.swift
//  AudioTT
//
//  Created by 🙈 🙊 on 2021/11/05.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var myProgress: UIProgressView!
    
    @IBOutlet var currLB: UILabel!
    
    @IBOutlet var endLB: UILabel!
    
    var aUrl:URL!  // 음원경로
    
    var aPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aUrl = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        do {
            aPlayer = try AVAudioPlayer(contentsOf: aUrl)
        } catch let e as NSError {
            print("애러발생:\(e)")
        }
        
    }
        
        func secToSte(_ time:TimeInterval)->String {
           // return "시간"
           let mm = Int(time/60)
            let ss = Int(time)%60
            return "\(mm) : \(ss)"
    
    }

    @IBAction func goPlay(_ sender: UIButton) {
        aPlayer.play()
        
        endLB.text = secToSte( aPlayer.duration)
        
    }
    
    
    @IBAction func goPause(_ sender: UIButton) {
        
        aPlayer.pause()
    }
    
    
    @IBAction func goStop(_ sender: UIButton) {
        aPlayer.stop()
        aPlayer.currentTime = 0
    }
    
    
    
    
    
    
    
}

