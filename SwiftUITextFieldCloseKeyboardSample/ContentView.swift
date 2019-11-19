//
//  ContentView.swift
//  SwiftUITextFieldCloseKeyboardSample
//
//  Created by Daisuke TONOSAKI on 2019/11/19.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            TextField("input here", text: $text)
                .keyboardType(.numberPad)
                .frame(width:300)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.closeKeyboard()
                    
            }
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
