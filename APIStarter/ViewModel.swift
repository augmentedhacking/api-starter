//
//  ViewModel.swift
//  APIStarter
//
//  Created by Nien Lam on 10/12/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import Foundation
import AVFoundation

@Observable
class ViewModel {
    var dbOutput: Float = 0
    
    init() {
        setUpAudioCapture()
    }
    
    private func setUpAudioCapture() {
            
        let recordingSession = AVAudioSession.sharedInstance()
            
        do {
            try recordingSession.setCategory(.playAndRecord)
            try recordingSession.setActive(true)
                
            recordingSession.requestRecordPermission({ result in
                    guard result else { return }
            })
                
            captureAudio()
                
        } catch {
            print("ERROR: Failed to set up recording session.")
        }
    }
    
    private func captureAudio() {
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("recording.m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            
            let audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
            audioRecorder.isMeteringEnabled = true
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                audioRecorder.updateMeters()
                let db = audioRecorder.averagePower(forChannel: 0)

                // Print output.
                print(db)

                // Set view model variable.
                self.dbOutput = db
            }
        } catch {
            print("ERROR: Failed to start recording process.")
        }
    }
}

