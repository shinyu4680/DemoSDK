//
//  SecondViewController.swift
//  DemoSDK
//
//  Created by kevin on 2018/5/15.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController, AVSpeechSynthesizerDelegate {

    
    var count = 0
    
    let synth = AVSpeechSynthesizer()
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        let speechUtteranceTwo = AVSpeechUtterance(string: "原來我們和愛情曾經靠得那麼近")
        speechUtteranceTwo.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        if count == 1{
            synthesizer.speak(speechUtteranceTwo)
            count = 0
        }
    }
    
    @IBAction func singBtnPressed(_ sender: Any) {
        let speechUtterance = AVSpeechUtterance(string: "原來你是我最想留住的幸運")
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        synth.speak(speechUtterance)
        count += 1
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        synth.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

