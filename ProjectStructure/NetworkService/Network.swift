//
//  Network.swift
//  ProjectFramework
//
//  Created by osx on 15/01/19.
//  Copyright © 2019 osx. All rights reserved.
//
enum Method:String{
    case post = "POST"
    case get =  "GET"
}

import Foundation
class Network{
    
    func request<Element:Decodable>(url:String,method:Method,headers:[String:String]? = nil,body:[[String:String]]? = nil,queryItems:[String:String]? = nil,success:@escaping (Element)->(),message:@escaping (String) -> ()) {
        
        guard var urlComponents = URLComponents.init(string: url) else {
            message(Constants.ERROR_MESSAGE)
            return
        }
        
        urlComponents.queryItems = getQueryItems(queryItems: queryItems)
        
        guard let URL = urlComponents.url else {
            message(Constants.ERROR_MESSAGE)
            return
        }
        
        var request = URLRequest.init(url: URL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = getData(params: body)
        print(body?.description ?? Constants.ERROR_MESSAGE)
        print(headers?.description ?? Constants.ERROR_MESSAGE)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else{
                guard let msg = error?.localizedDescription else{
                    message(Constants.ERROR_MESSAGE)
                    return
                }
                message(msg)
                return
            }
            print("---------------------------------")
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                print(json ?? Constants.ERROR_MESSAGE)
                
            }catch{
                print(error.localizedDescription)
            }
            
            do{
                let obj = try JSONDecoder().decode(Element.self, from: data)
                success(obj)
            }catch{
                message(error.localizedDescription)
            }
            
            print("----------------------------------")
        }
        
        task.resume()
        
    }
    
    deinit {
        print("Network deallocated")
    }
    
    //MARK:- QUERY ITEMS
    private func getQueryItems(queryItems:[String:String]?) -> [URLQueryItem]?{
        
        guard let queryItems = queryItems else{
            return nil
        }
        
        var items = [URLQueryItem]()
        for (key,value) in queryItems{
            items.append(URLQueryItem.init(name: key, value: value))
        }
        return items
    }
    
    //MARK:- HTTPBODY DATA
    private func getData(params:[[String:String]]?) -> Data?{
        
        guard let params = params else {
            return nil
        }
        
        let data = NSMutableData()
        
        for (index,param) in params.enumerated() {
            for (key,value) in param{
                let string = "\(index == 0 ? "" : "&")\(key)=\(value)"
                print(string)
                if let elementData = string.data(using: .utf8){
                    data.append(elementData)
                }
            }
        }
        return data as Data
        
    }
}

