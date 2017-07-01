//
//  MSMorsaCodePlayer.swift
//  Morsa
//
//  Created by Moxtra on 2017/6/30.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit
import AudioKit

class MSMorsaCodePlayer: NSObject {
    
    private var oscillator = AKOscillator()
    private var oscillator1 = AKOscillator()
    private var mixer = AKMixer()
    
    //MARK: - Singelton
    static let sharedPlayer = MSMorsaCodePlayer()
    
    private override init() {
        mixer = AKMixer(oscillator,oscillator1)
        mixer.volume = 0.5
        AudioKit.output = mixer
        super.init()
    }
    
    func playMorsaCode(code: MSMorsaCode) {
        oscillator.amplitude = random(0.5,1)
        oscillator.frequency = random(220,880)
        oscillator.start()
        oscillator1.amplitude = random(0.5,1)
        oscillator1.frequency = random(220,880)
        oscillator1.start()
        AudioKit.start()
    }
}
