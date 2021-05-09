//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/1/21.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var mText: String
    // whe you bind a variable it means that it linked to something else 
    
    var body: some View {
        HStack {
            TextField("message", text: $mText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Send")
            })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(mText: .constant("Message..."))
    }
}
