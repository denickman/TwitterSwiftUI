//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/2/21.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter: TweetFilterOption = .tweets
    
    var body: some View {
        
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
            }
        }
         .navigationTitle("Batman")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
