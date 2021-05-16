//
//  UserCell.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 4/26/21.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
//            Image("ic_venom")
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullName)
                    .font(.system(size: 14))
            })
            .foregroundColor(.black)
        }
    }
}
