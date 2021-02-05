//
//  ContentView.swift
//  AnimatedBarsSwiftUI
//
//  Created by Davelaar,Clinton B on 2/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        [150, 75, 225, 23, 83, 150, 225],
        [123, 65, 23, 200, 250, 10, 86],
        [76, 75, 123, 199, 210, 150, 215],
    ]
    
    var body: some View {
        ZStack{
            
            Color(#colorLiteral(red: 0, green: 1, blue: 0.8479838967, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calory Intake")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                Picker(selection:$pickerSelectedItem, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                    Text("Weekday").tag(0)
                    Text("Afternon").tag(1)
                    Text("Evening").tag(2)
                    
                }).pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                HStack(spacing: 24) {
                    BarView(value: dataPoints[pickerSelectedItem][0], day: "Su")
                    BarView(value: dataPoints[pickerSelectedItem][1], day: "M")
                    BarView(value: dataPoints[pickerSelectedItem][2], day: "Tu")
                    BarView(value: dataPoints[pickerSelectedItem][3], day: "W")
                    BarView(value: dataPoints[pickerSelectedItem][4], day: "Th")
                    BarView(value: dataPoints[pickerSelectedItem][5], day: "F")
                    BarView(value: dataPoints[pickerSelectedItem][6], day: "Sa")
                    
                }.padding(.top, 24)
                .animation(.default)
            }
            
        }
        
    }
}

struct BarView: View {
    var value: CGFloat
    var day: String
    
    var body: some View {
        VStack{
            ZStack (alignment: .bottom) {
                
                Capsule().frame(width: 30, height: 250)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.5496031046, blue: 0.4979242086, alpha: 0.3493067782)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(day).padding(.top, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
