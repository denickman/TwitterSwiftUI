//
//  ProfileHeaderView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/3/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    @State var selectedFilter: TweetFilterOption = .tweets
    @Binding var isFollowed: Bool
    let viewModel: ProfileViewModel

    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .shadow(color: .black, radius: 15, x: 0.0, y: 0.0)
//                .cornerRadius(120/2) - alternrative to clipshape circle
            
            Text(viewModel.user.fullName)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Billionare by day, dark knight by night")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("12")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            ProfileActionButtonView(viewModel: viewModel, isFollowed: $isFollowed)
            FilterButtonView(selectedOption: $selectedFilter)
            Spacer() 
        }
    }
}
