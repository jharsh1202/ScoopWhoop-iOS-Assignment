//
//  API.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 23/06/21.
//

import Foundation

class API {
    func getData (from url : String)  {
        print("retriving Data ")
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data=data, error == nil else {
                return
            }
            var result: Response?
            do {
                try result = JSONDecoder().decode(Response.self, from: data)
            } catch {
                print("didnt't work out to convert json to your structure")
            }
            
            guard let jsonData = result else {
                return
            }
            
            print(jsonData.status)
            print(jsonData.data)
            
        }.resume()

    }
}
