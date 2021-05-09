//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 4/26/21.
//

import SwiftUI

struct ConversationCell: View {
    
    var body: some View {
        HStack(spacing: 12) {
            Image("ic_venom")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text("Venom")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("abracadabra sploshnaya abrakadabra here with me singing haleluya")
                    .font(.system(size: 15))
                    .lineLimit(2)
            })
            .foregroundColor(.black)
            .padding(.trailing)
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
