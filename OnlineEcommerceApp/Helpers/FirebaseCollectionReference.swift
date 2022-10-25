//
//  FirebaseCollectionReference.swift
//  OnlineEcommerceApp
//
//  Created by User on 23/10/22.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String{
    case User
    case Category
    case Items
    case Basket
}


func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference{
    
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
