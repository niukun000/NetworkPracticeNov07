//
//  NetworkManager.swift
//  IntroToNetworking
//
//  Created by Kun Niu on 11/7/22.
//

import Foundation

class NetworkManager {
    var tempID : String = ""
    func fetchImageData(path: String,  completion: @escaping(Data?) -> Void){
        guard let url = URL(string: path) else{
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completion(nil)
                return
            }
            let httpResponse = response as? HTTPURLResponse
            self.tempID = httpResponse?.value(forHTTPHeaderField: "picsum-id") ?? "0"
            
//            print(httpResponse?.allHeaderFields.values)
            
//            if let dataString = String(data: data!, encoding: .utf8) {
//                print(dataString)
//            }
            
//            print("All headers: \(response?.url)")
//            if let url = String(response?.url){
////                for i in 0...(url.count-1){
////                    if url[i]+url[i+1]
//                }
//            }
            completion(data)
//            for i in response!{
//                print(i)
//            }
        }
        task.resume()
    }
}
