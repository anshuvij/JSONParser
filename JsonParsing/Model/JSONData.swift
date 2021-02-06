//
//  JSONData.swift
//  JsonParsing
//
//  Created by Mobile Apps Team on 2/5/21.
//

/**"postId": 1,
 "id": 1,
 "name": "id labore ex et quam laborum",
 "email": "Eliseo@gardner.biz",
 "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"*/

import Foundation

struct JSONData : Codable {
    let name : String?
    let email : String?
    let body : String?
}
