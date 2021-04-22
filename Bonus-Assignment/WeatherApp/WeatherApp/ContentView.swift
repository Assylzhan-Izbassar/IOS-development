//
//  ContentView.swift
//  WeatherApp
//
//  Created by macbook on 22.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack(spacing: 8) {
                CityTextView(cityName: "Cupertino, CA")
                
                WeatherStatusView(statusImage: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 50 : 78)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", weatherStateName: "cloud.sun.fill", temperature: 78)
                    WeatherDayView(dayOfWeek: "WED", weatherStateName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "THU", weatherStateName: "wind.snow", temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI", weatherStateName: "sunset.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT", weatherStateName: "snow", temperature: 25)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    ButtonTextView(title: "Change Day Time", backgroundColor: .white, foregroundColor: .blue)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var weatherStateName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: weatherStateName).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°").font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("white-blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    
    var statusImage: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: statusImage).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°").font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
