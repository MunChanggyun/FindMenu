//
//  Network.swift
//  FindMenu
//
//  Created by mac on 2022/12/06.
//

import Foundation

class NetWork {
    static let shared = NetWork()
    var url: String?
    
    
    init(url: String? = nil) {
        self.url = url
    }
    
    func getData() {
        guard let getUrl = url else {
            return
        }
        
        guard let requestURL = URL(string: getUrl) else {
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        print(requestURL.description)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("response fail \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
                return
            }
            
            guard let data = data else {
                print("data is nil")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            
            print("-----1> responseJSON: \(responseJSON)")
                        if let responseJSON = responseJSON as? [String: Any] {
                            print("-----2> responseJSON: \(responseJSON)")
                        }
            
            
//            do {
//                let apiResponse = try JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
//            } catch (let err) {
//                print(err.localizedDescription)
//            }
        }
        
        task.resume()
    }
}
