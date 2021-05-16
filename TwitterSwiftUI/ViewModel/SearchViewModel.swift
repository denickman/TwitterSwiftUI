//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/13/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else { return }
            
            documents.forEach { (document) in
                let user = User(dictionary: document.data())
                self.users.append(user)
                
                print("DEBUG: User \(user)")
            }
        }
    }
}
