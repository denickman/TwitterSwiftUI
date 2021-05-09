//
//  MockMessage.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/2/21.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}
