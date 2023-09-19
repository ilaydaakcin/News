//
//  Constant.swift
//  News
//
//  Created by Apple on 18.09.2023.
//

import Foundation

class Constant {
    
}

//URL CONSTANT

extension Constant {
    
    enum ServiceEndPoint : String {
        
        case BASE_URL = "https://newsapi.org/v2/"
        case TYPE = "top-headlines?country=us&"
        case API_KEY = "apiKey=7fd6eca3dcf246afb4182c9601e8a52b"
        
        static func newsServiceEndPoint() -> String {
            "\(BASE_URL.rawValue)\(TYPE.rawValue)\(API_KEY.rawValue)"
        }
    }
    
}
