//
//  ApiRepository.swift
//  CATastrophic
//
//  Created by Gamil Ali Qaid Shamar on 21/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import Foundation
let dataErrorDomain = "dataErrorDomain"

enum DataErrorCode: NSInteger {
    case networkUnavailable = 101
    case wrongDataFormat = 102
}
class ApiRepository {
    
    private init() {}
    static let shared = ApiRepository()
    
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "https://api.thecatapi.com/v1/images/search?limit=30&page=")!
    
    func getCats(page : Int ,completion: @escaping(_ catModelList: [DCatDecodeModelElement]?, _ error: Error?) -> ()) {
        _ = baseURL.appendingPathComponent("\(page)&mime_types=png")
        urlSession.dataTask(with: baseURL) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: dataErrorDomain, code: DataErrorCode.networkUnavailable.rawValue, userInfo: nil)
                completion(nil, error)
                return
            }
            
            do {
                
                let catDecodeModel:[DCatDecodeModelElement] = try DCatDecodeModel(data: data)
              
                completion(catDecodeModel, nil)
            } catch {
                print(error)
                completion(nil, error)
            }
        }.resume()
    }
    
}
