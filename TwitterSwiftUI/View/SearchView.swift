//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 4/25/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    HStack { Spacer() }
                    
                    NavigationLink(
                        destination: UserProfileView(user: user),
                        isActive: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/,
                        label: {
                            UserCell(user: user)
                        })
                }
            }.padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
