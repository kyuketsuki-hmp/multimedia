//
//  ViewController.swift
//  MultinediaDemo
//
//  Created by mic-student5 on 7/28/19.
//  Copyright © 2019 mic. All rights reserved.
//

import UIKit
//must know av
import AVKit

class ViewController: UIViewController {
    
    var player:AVAudioPlayer!
    var videoPlayer:AVPlayer!
    
    @IBAction func changeTimimg(_ sender:UISlider){
        
        let value = sender.value
        player.currentTime = player.duration * Double(value)
        
    }
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var remTimeLabel: UILabel!
    
    @IBAction func play(_ sender:UIBarButtonItem){
        player.play()
        updateRemainingTime()
    }
    func updateRemainingTime()
    {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (timer) in
            
            if self.player.isPlaying{
            let remTime = self.player.duration - self.player.currentTime
            
            print(remTime)
            self.slider.value = Float(self.player.currentTime / self.player.duration)
                self.remTimeLabel.text = String(Int(remTime))
            }
            else {
                timer.invalidate()
            }
            
            
        }
        
    }
    
    
    @IBAction func stop(_ sender:UIBarButtonItem){
        player.stop()
        self.slider.value = 0.0
        self.remTimeLabel.text = "00:00"
    }
    
    @IBAction func pause(_ sender:UIBarButtonItem){
        player.pause()
    }
    
    
    @IBAction func playVideo(_ sender:UIButton){
       // if let fileURL = Bundle.main.url(forResource: "myvideo", withExtension: "mp4"){
        if let fileURL = URL(string: "https://gcs-vimeo.akamaized.net/exp=1564328076~acl=%2A%2F820066352.mp4%2A~hmac=539025f7af343521fdfaf4316d22846f898770c43e48dbfcad1e2e34c9f384ba/vimeo-prod-skyfire-std-us/01/1351/9/231758808/820066352.mp4?download=1&filename=Peppered+-+11667.mp4"){
            do{
                
                let videoPlayerController = AVPlayerViewController()
                
                videoPlayer = try AVPlayer(url: fileURL)
                videoPlayerController.player = videoPlayer
                present(videoPlayerController, animated: true,completion: nil)
                
                
                //videoPlayerController.view.frame = CGRect(x:40, y:140, width: 200, height: 100)
                //videoPlayerController.showsPlaybackControls = false
                //videoPlayer.play()
                //view.addSubview(UIViewController.view)
                
            }catch{
//            print("This is catch block")
        }
    }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fileURL = Bundle.main.url(forResource: "marshmello", withExtension: "mp3"){
        do{
        
        player = try AVAudioPlayer(contentsOf: fileURL)
            print("Player Created")
            //playdummy
            //player.play()
        }catch{
            print("Audio file not found")
        }
        }
    }


}

