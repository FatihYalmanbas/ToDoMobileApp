//
//  HeaderView.swift
//  ToDoList
//
//  Created by Cihan Yilmaz on 12/22/24.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subtitle : String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees:angle))
                
             VStack {
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset(y:-150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
                    HeaderView(title: "Title",
                               subtitle: "Subtitle",
                               angle: 15,
                               background: .blue)
        
                    HeaderView(title: "Primary",
                               subtitle: "Main Header",
                               angle: 0,
                               background: .red)
                    
                    HeaderView(title: "Secondary",
                               subtitle: "Another Header",
                               angle: 10,
                               background: .blue)
                    
                    HeaderView(title: "Tertiary",
                               subtitle: "Extra Header",
                               angle: -15,
                               background: .green)
                    HeaderView(title: "iPhone",
                               subtitle: "Test on iPhone",
                               angle: 0,
                               background: .purple)
                               .previewDevice("iPhone 14")
                       
                    HeaderView(title: "iPad",
                               subtitle: "Test on iPad",
                               angle: 15,
                               background: .orange)
                               .previewDevice("iPad Pro (12.9-inch)")
                }
    }
}
