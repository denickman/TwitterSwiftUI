//
//  ConversationsView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 4/26/21.
//

import SwiftUI

struct ConversationsView: View {
    
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            NavigationLink(destination: ChatView(),
                isActive: $showChat,
                label: {})
            
            ScrollView {
                LazyVStack { // load only cell as needed
                    ForEach(0..<20) { _ in
                        NavigationLink(destination: ChatView(),
                            label: {
                                ConversationCell()
                            })
                        Divider()
                    }
                }
                .padding()
            }
            
            Button(action: {
                self.isShowingNewMessageView.toggle()
            }, label: {
//                Image(systemName: "pencil") // got from SF Symbols
                    Image(systemName: "envelope")
                    .resizable()
                        .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .cornerRadius(16)
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
                // when you click on this button need to show message view
                // show SearchView sheet
                // if $isShowingNewMessageView - if true - present the sheet
                // if $isShowingNewMessageView if false - dismiss this sheet
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
