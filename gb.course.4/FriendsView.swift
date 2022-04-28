//
//  FriendsView.swift
//  gb.course.4
//
//  Created by yoji on 4/28/22.
//

import SwiftUI

struct FriendsView: View {
    
   
    var body: some View {
        FriendsContent()
    }
}

struct FriendsContent: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color.white, Color.blue, Color.red],
        startPoint: .top,
        endPoint: .bottom)
    
    
    var body: some View {
        
      
        ZStack {
            backgroundGradient
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack (alignment: .bottom, spacing: 0){
                    Image("vasya")
                        .resizable()
                        .cornerRadius(30)
                        .frame(width: 80, height: 80)
                        //.border(Color.red)
                        .padding(.trailing, 50)
                        
                    
                    Text("Вася")
                        .padding(.trailing,50)
                    Text("Пупкин")
                        .padding(.trailing, 25)
                }.frame(maxWidth: 350)
                    .padding()
            }.background(Color.white)
                .cornerRadius(20)
                .shadow(color: .black, radius: 10, x: 15, y: 15)
                
        }
        
        
        }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
