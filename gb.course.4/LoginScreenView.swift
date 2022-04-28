//
//  ContentView.swift
//  gb.course.4
//
//  Created by yoji on 4/21/22.
//

import SwiftUI
import Combine

struct LoginScreenView: View {
    @State private var opacity = 0.75
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge (NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification) .map{ _ in true }, NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).map { _ in false })
        .removeDuplicates()
    
    let backgroundGradient = LinearGradient(
        colors: [Color.white, Color.blue, Color.red],
        startPoint: .top,
        endPoint: .bottom)
    
    var body: some View {
        
        ZStack {
            
            backgroundGradient
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView(showsIndicators: false) {
                
                VStack {
                    
                    if shouldShowLogo {
                        HStack {
                        Image("vk_logo")
                                .resizable()
                                .frame(width: 125, height: 125)
                                .padding(.top, 65)
                                .shadow(color: .black, radius: 10, x: 25, y: 35)
                    }
                    }
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
                                //.shadow(color: .black, radius: 10, x: 25, y: 35)
                            
                            
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
                    
                    .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.easeInOut(duration: 0.5)) { self.shouldShowLogo = !isKeyboardOn
                    }
                        
                    }
                    .frame(maxWidth: 325)
                    .padding()
                    .background(.white)
                    .opacity(opacity)
                    .cornerRadius(5)
                    .shadow(color: .black, radius: 10, x: 25, y: 35)
                    .padding(.top, 125)
                    .edgesIgnoringSafeArea(.all)
                    
                    
                }.onTapGesture {
                    UIApplication.shared.endEditing()
                }
            } .padding()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                LoginScreenView()
            }
        }

extension UIApplication {
            func endEditing() {
                sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }


