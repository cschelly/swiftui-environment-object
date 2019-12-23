//
//  GraphView.swift
//  EnvironmentObject
//
//  Created by Christina S on 12/6/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct GraphView: View {

    @Binding var percentage: Float // or some value binded

    var body: some View {
        let graphColor = calcGraphColor(using: percentage)
        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.6)
                Rectangle()
                    // TODO: Make accent color dynamic based on percentage
                    .foregroundColor(graphColor.0)
                    .opacity(graphColor.1)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    self.percentage = min(max(0, Float(value.location.x / geometry.size.width)), 100)
                }))
        }.frame(width: 340, height: 60, alignment: .center)
    }
    
    func calcGraphColor(using percentage: Float) -> (Color, Double) {
        switch percentage {
        case 0.0...30.0:
            return (.red, 1.0)
        case 30.1...50.0:
            return (.orange, 0.7)
        case 50.1...70.0:
            return (.yellow, 0.6)
        case 70.1...100.0:
            return (.green, 1.0)
        default:
            break
        }
        return (.orange, 0.7)
    }

}



struct GraphView_Previews: PreviewProvider {
    @State var percentage: Float = 50
    static var previews: some View {
        GraphView(percentage: .constant(29.0))
    }
}
