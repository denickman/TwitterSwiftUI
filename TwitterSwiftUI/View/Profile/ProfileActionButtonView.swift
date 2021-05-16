//
//  ProfileActionButtonView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/3/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    private struct Constants {
        static let currentUserProfileButtonWidth: CGFloat = 360.0
        static let currentUserProfileButtonHeight: CGFloat = 40.0
    }
    
    let viewModel: ProfileViewModel
    @Binding var isFollowed: Bool
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(action: {}, label: {
                Text("Edit profile")
                    .frame(width: Constants.currentUserProfileButtonWidth, height: Constants.currentUserProfileButtonHeight)
                    .background(Color.blue)
                    .foregroundColor(.white)
            })
            .cornerRadius(20.0)
        } else {
            HStack {
                Button(action: {
                    print("DEBUG: Follow here...")
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .frame(width: Constants.currentUserProfileButtonWidth/2, height: Constants.currentUserProfileButtonHeight)
                        .background(Color.blue)
                        .foregroundColor(.white)
                })
                .cornerRadius(20.0)
                
                Button(action: {}, label: {
                    Text("Message")
                        .frame(width: Constants.currentUserProfileButtonWidth/2, height: Constants.currentUserProfileButtonHeight)
                        .background(Color.purple)
                        .foregroundColor(.white)
                })
                .cornerRadius(20.0)
            }
        }
    }
}
