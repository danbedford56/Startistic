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
                let id = queryDocumentSnapshot.documentID
                let username = data["username"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                return User(id: id, username: username, password: password)
            }
            completionHandler(dataArray)
        }
    }
    
    static func fetch_portfolios(completionHandler: @escaping (_ data: Array<Portfolio>) -> ()) {
        var dataArray: Array<Portfolio> = []
        
        db.collection("portfolios").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            dataArray = documents.map { queryDocumentSnapshot -> Portfolio in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let user_id = data["user_id"] as? String ?? ""
                let post = data["post1"] as? String ?? ""
                return Portfolio(id: id, user_id: user_id, post: post)
            }
            completionHandler(dataArray)
        }
    }
    
    static func get_portfolio(user_id: String, completionHandler: @escaping (_ data: Portfolio) -> ()) {
        fetch_portfolios() { dataArray in
            for portfolio in dataArray {
                if portfolio.user_id == user_id {
                    completionHandler(portfolio)
                }
            }
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
