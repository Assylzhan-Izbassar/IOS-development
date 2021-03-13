//
//  Alarm.swift
//  AlarmApp
//
//  Created by macbook on 12.03.2021.
//

import Foundation

class Alarm {
    
    var time: String
    var isOn: Bool
    var note: String
    
    init(_ time: String, _ isOn: Bool, _ note: String) {
        self.time = time
        self.isOn = isOn
        self.note = note
    }
}
