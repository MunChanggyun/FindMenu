//
//  Network.swift
//  FindMenu
//
//  Created by mac on 2022/12/06.
//

import Foundation

/**
 변경됨을 알려주기 위해서 ObservableObject 를 사용하는데
 변경사항에 대해서 objectWillChange.send()를이용하여 변경됨을 알려주는데
 @Published를 사용하여 변경시마다 objectWillChange.send()를 사용하는것을 방지한다.
 
 감시대상 클래스 변수에는 @ObservedObject를 선언한다.(변경한걸 확인하고자 하는쪽)
 */
class NetWork: ObservableObject {
    enum State {
        case idle
        case loading
        case fail
        case success
        
    }
    
    @Published var state = State.idle
    @Published var responseData:Any = []
    
    static let shared = NetWork()
        
    func getData(url: String, params: [String: Any]? = nil) {
        state = State.loading
        guard let requestURL = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        print(requestURL.description)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                self.state = State.fail
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("response fail \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
                self.state = State.fail
                return
            }
            
            guard let data = data else {
                self.state = State.fail
                print("data is nil")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            
            self.state = State.success
            self.responseData = responseJSON ?? []
            print("-----1> responseJSON: \(responseJSON ?? "response is null")")
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
