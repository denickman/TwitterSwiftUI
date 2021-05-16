//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 4/20/21.
//

import SwiftUI
import Kingfisher

struct MainView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel // no need to init this like @binding
    
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        
                        SearchView() // view that associated with tab item
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        
                        ConversationsView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Message")
                            }
                    }
                    .navigationBarTitle("Home")
                    .navigationBarItems(leading:
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        if let user = viewModel.user {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(width: 32, height: 32)
                                .cornerRadius(16)
                        }
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
