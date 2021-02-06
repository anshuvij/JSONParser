//
//  JSONProtocol.swift
//  JsonParsing
//
//  Created by Mobile Apps Team on 2/6/21.
//

import Foundation
protocol JSONManagerDelegate {
    func getList(_ Manager : JSONManager, Data : [JSONData])
    func didFailWithError(error : Error)
}
