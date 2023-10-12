//
//  ViewModel.swift
//  APIStarter
//
//  Created by Nien Lam on 10/12/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import Foundation
import PolarBleSdk
import RxSwift
import CoreBluetooth


@Observable
class ViewModel: PolarBleApiObserver {
    // Heart rate for display.
    var currentHeartRate: Int = 0

    // Device id.
    static let deviceId = "B2FCC228"

    // Setup API to listen to heart rate.
    var api = PolarBleApiDefaultImpl.polarImplementation(DispatchQueue.main,
                                                         features: [PolarBleSdkFeature.feature_hr])

    // Required for update subscription.
    var broadcastDisposable: Disposable?
    
    init() {
        api.observer = self
        
        broadcastDisposable = api.startListenForPolarHrBroadcasts(nil)
            .observe(on: MainScheduler.instance)
            .subscribe{ e in
                switch e {
                case .completed:
                    print("Broadcast listener completed")
                case .error(let err):
                    print("Broadcast listener failed. Reason: \(err)")
                case .next(let broadcast):
                    print("HR BROADCAST \(broadcast.deviceInfo.name) HR:\(broadcast.hr) Batt: \(broadcast.batteryStatus)")

                    // Capture heart rate.
                    self.currentHeartRate = Int(broadcast.hr)
                }
            }
        
    }

    func deviceConnecting(_ identifier: PolarBleSdk.PolarDeviceInfo) {
    }
    
    func deviceConnected(_ identifier: PolarBleSdk.PolarDeviceInfo) {
    }
    
    func deviceDisconnected(_ identifier: PolarBleSdk.PolarDeviceInfo, pairingError: Bool) {
    }
}



