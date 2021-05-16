//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 4/20/21.
//

import SwiftUI

struct FeedView: View {
    
    @State var isShowingNewTweetView = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack { // load only cell as needed
                    ForEach(0..<20) { _ in
                        TweetCell()
                    }
                }
                .padding()
            }
            
            Button(action: {
//                viewModel.signOut()
                isShowingNewTweetView.toggle()
            }, label: {
                //Image(systemName: "pencil") // got from SF Symbols
                Image("ic_write")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .cornerRadius(16)
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView, content: {
                NewTweetView(isPresented: $isShowingNewTweetView)
            })
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
