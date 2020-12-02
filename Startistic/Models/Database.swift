//
//  Database.swift
//  Startistic
//
//  Created by Dan Bedford on 01/12/2020.
//
import Foundation
import FirebaseFirestore

class Database {
    
    private static var db = Firestore.firestore()
    
    static func fetch_users(completionHandler: @escaping (_ data: Array<User>) -> ()) {
        var dataArray: Array<User> = []
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            dataArray = documents.map { queryDocumentSnapshot -> User in
                let data = queryDocumentSnapshot.data()
                let username = data["username"] as? String ?? ""
                return User(id: .init(), username: username)
            }
            completionHandler(dataArray)
        }
    }
    
    static func create_user(_ user: [String : Any]) {
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: user) { err in
            if err != nil {
                print("Error adding user")
            } else {
                print("Added user")
            }
        }
        
    }
    
    
}
