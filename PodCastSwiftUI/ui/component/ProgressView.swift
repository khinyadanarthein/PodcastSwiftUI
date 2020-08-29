//
//  ProgressView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 29/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    
    @Binding var completePercentage : CGFloat
    
    private var progressColor : UIColor
    private let sliderCornerRadius : CGFloat = 8
    
    init(color: UIColor = UIColor.green, completionPercentage: Binding<CGFloat>) {
        self.progressColor = color
        self._completePercentage = completionPercentage
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { value in
                Color(.gray)
                    .cornerRadius(self.sliderCornerRadius)
                Color(self.progressColor)
                    .frame(width: value.size.width * (min(max(0, self.completePercentage), 100) / 100))
                    .cornerRadius(self.sliderCornerRadius)
                .shadow(radius: 3)
            }
        }
    }
}

struct DemoView : View {
    
    @State var value : CGFloat = 0
    
    var body : some View {
        VStack {
            ProgressView(color: .red, completionPercentage: $value)
                .frame(height: 15)
            
            Slider(value: $value, in: 0...100,
                   onEditingChanged: { _ in },
                   minimumValueLabel: Text("0"),
                   maximumValueLabel: Text("100"),
                   label : { Text("Slide for percentage") } )
            
        }.padding([.leading, .trailing], 15)
        
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        //ProgressView(completionPercentage: .constant(50))
        
        DemoView()
    }
}
