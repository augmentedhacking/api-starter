//
//  ViewModel.swift
//  APIStarter
//
//  Created by Nien Lam on 10/12/23.
//

import Foundation

@Observable
class ViewModel {
    var dateString: String = ""
  
    var timer: Timer?
    
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil, 
                                     repeats: true)
    }
    
    func getDateString() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        let dateString = formatter.string(from: Date())
        return dateString
    }

    // Called every second.
    @objc func updateTimer() {
        dateString = getDateString()
    }
}
