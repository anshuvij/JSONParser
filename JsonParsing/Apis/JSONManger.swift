//
//  JSONManger.swift
//  JsonParsing
//
//  Created by Mobile Apps Team on 2/5/21.
//

import Foundation

struct JSONManager {
    
    var delegate : JSONManagerDelegate?
    
   
    
    func getData() {
        
        let url = "https://jsonplaceholder.typicode.com/posts/1/comments"
        
        if let url = URL(string: url)
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error)  in
                
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data
                {
                    let Data = self.parseJSON(safeData)
                    self.delegate?.getList(self, Data: Data)
                }
                
            }
            task.resume()
        }
        
    }
    
    func parseJSON( _ Data : Data) -> [JSONData]
   {
       var array:[JSONData]?
       let decoder = JSONDecoder()
           do {
               let decodeData : [JSONData] = try decoder.decode([JSONData].self, from: Data)
            array = decodeData
           }
       catch {
           self.delegate?.didFailWithError(error: error)
           return array!
           
       }

       return array!
   }
    
}
