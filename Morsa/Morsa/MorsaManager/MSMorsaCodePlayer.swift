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
    
    private var oscillatorDot = AKPWMOscillator()
    private var oscillatorDotLine = AKPWMOscillator()
    private var soundPlayQueue = DispatchQueue.init(label: "xxxx")
    private let semaphore = DispatchSemaphore.init(value: 1)
    //MARK: - Singelton
    static let sharedPlayer = MSMorsaCodePlayer()
    
    private override init() {
        AudioKit.output = oscillatorDot
        AudioKit.start()
        oscillatorDot.frequency = 80.midiNoteToFrequency()
        oscillatorDot.pulseWidth = 0.5
        oscillatorDot.rampTime = 0
        oscillatorDot.amplitude = 0.1
        super.init()
    }
    
    func playMorsaCodes(codes:Array<MSMorsaCode>) {
        for code in codes {
            self.playMorsaCode(code: code)
        }
    }
    
    private func playMorsaCode(code:MSMorsaCode) {
        for character in (code.code.characters) {
            if character == "-" {
                playMorsaCodeLine()
            }
            else {
                playMorsaCodeDot()
            }
        }
    }
    
    private func playMorsaCodeDot() {
        soundPlayQueue.async {
            let result = self.semaphore.wait(timeout: DispatchTime.distantFuture)
            if result == DispatchTimeoutResult.success {
                self.oscillatorDot.play()
                Thread.sleep(forTimeInterval: 0.5)
                self.oscillatorDot.stop()
                Thread.sleep(forTimeInterval: 0.5)
                self.semaphore.signal()
            }
        }
    }
    
    private func playMorsaCodeLine() {
        soundPlayQueue.async {
            let result = self.semaphore.wait(timeout: DispatchTime.distantFuture)
            if result == DispatchTimeoutResult.success {
                self.oscillatorDot.play()
                Thread.sleep(forTimeInterval: 1)
                self.oscillatorDot.stop()
                Thread.sleep(forTimeInterval: 0.5)
                self.semaphore.signal()
            }
        }
    }
}
