//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by macbook on 22.04.2021.
//

import SwiftUI

struct ButtonTextView: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        Text("Change Day Time")
            .frame(width: 280, height: 50, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10.0)
    }
}
