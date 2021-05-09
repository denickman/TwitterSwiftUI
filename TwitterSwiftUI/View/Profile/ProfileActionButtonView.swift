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
    
    let isCurrentUser: Bool
    
    var body: some View {
        if isCurrentUser {
            Button(action: {}, label: {
                Text("Edit profile")
                    .frame(width: Constants.currentUserProfileButtonWidth, height: Constants.currentUserProfileButtonHeight)
                    .background(Color.blue)
                    .foregroundColor(.white)
            })
            .cornerRadius(20.0)
        } else {
            HStack {
                Button(action: {}, label: {
                    Text("Follow")
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

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView(isCurrentUser: false)
    }
}
