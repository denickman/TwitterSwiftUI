//
//  NewMessageView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/2/21.
//

import SwiftUI

struct NewMessageView: View {
    
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    HStack { Spacer() }
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                    }, label: {
                        UserCell(user: user)
                    })
                }
            }.padding(.leading)
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
