//
//  AlarmModel.swift
//  AlarmApp
//
//  Created by macbook on 12.03.2021.
//

import Foundation

class AlarmModel {
    
    private static var alarms: Array<Alarm>? = Array<Alarm>()
    
    init() {
        testData()
    }
    
    func addAlarm(_ newAlarm: Alarm?) {
        if let x = newAlarm {
            AlarmModel.alarms?.append(x)
        }
    }
    
    func removeAlarm(_ indexPath: IndexPath) {
        removeAlarm(withId: indexPath.row)
    }
    
    func removeAlarm(withId id: Int) {
        AlarmModel.alarms?.remove(at: id)
    }
    
    func editAlarm(_ id: Int, _ edited: Alarm) {
        AlarmModel.alarms?[id].time = edited.time
        AlarmModel.alarms?[id].note = edited.note
        AlarmModel.alarms?[id].isOn = edited.isOn
    }
    
    func getAlarms() -> Array<Alarm> {
        return AlarmModel.alarms ?? Array<Alarm>()
    }
    
    func testData() {
        addAlarm(Alarm("23:00", true, "Wake Up!"))
    }
}
