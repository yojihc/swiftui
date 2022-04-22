//
//  ContentView.swift
//  gb.course.4
//
//  Created by yoji on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var opacity = 0.75
    @State private var login = ""
    @State private var password = ""
    
    let backgroundGradient = LinearGradient(
        colors: [Color.white, Color.blue, Color.red],
        startPoint: .top,
        endPoint: .bottom)
    
    var body: some View {
        
        ZStack {
            
            backgroundGradient
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack {
                
                HStack {
                    
                    Text("Login:")
                    Spacer()
                    TextField("", text: $login)
                        .frame(maxWidth: 200)
                        .textFieldStyle(.roundedBorder)
                    
                }
                
                HStack {
                    
                    Text("Password")
                    Spacer()
                    SecureField("", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 200)
                    
                    
                }
                
                HStack {
                    
                    Button(action: { print("Hello") }) {
                        Text("Log in")
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 50)
                    .disabled(login.isEmpty || password.isEmpty)
                    .textFieldStyle(.roundedBorder)
                    .background(.white)
                    .cornerRadius(5)
                    
                }
                
            }
            
            .frame(maxWidth: 300)
            .padding()
            .background(.white)
            .opacity(opacity)
            .cornerRadius(5)
            .shadow(color: .black, radius: 10, x: 25, y: 35)
            .padding()
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

