//
//  User.swift
//  JSONDecoder Nested API using Storyboard
//
//  Created by Md Khaled Hasan Manna on 6/7/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation

struct User : Codable {
    var id : Int?
    var name :String?
    var email : String?
    var address : Address
}
struct Address : Codable{
    var street : String?
    var city : String?
    var geo : Geo
    
}
struct Geo : Codable{
    
    var latitude :String?
    var longitude : String?
    
    enum CodingKeys : String,CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
    
}
