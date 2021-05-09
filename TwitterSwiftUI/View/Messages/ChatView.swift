//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/1/21.
//

import SwiftUI

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "ic_batman", messageText: "Why do you want to kill me JOker?", isCurrentUser: false),
    .init(id: 1, imageName: "ic_spiderman", messageText: "Let us make a healthy habbits", isCurrentUser: true),
    .init(id: 2, imageName: "ic_spiderman", messageText: "Do you want to taste my precious cum?", isCurrentUser: true),
    .init(id: 3, imageName: "ic_batman", messageText: "NO thanks i would rather abstain my decision", isCurrentUser: false),
    .init(id: 4, imageName: "ic_batman", messageText: "What do you know about his preferences before. How long do we have to stay here?", isCurrentUser: false),
]


struct ChatView: View {
    
    @State var messageText: String = ""
    // will be able to grab the mwsage text whenever it changes
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
                        MessageView(message: message)
                    }
                }
            }
            .padding(.top)
            
            MessageInputView(mText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

