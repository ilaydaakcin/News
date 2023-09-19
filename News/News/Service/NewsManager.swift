//
//  NewsManager.swift
//  News
//
//  Created by Apple on 18.09.2023.
// 

import Foundation

class NewsManager {
    
    
    func fetchNewsData(completion : @escaping([Article]?) -> ()) {
        
        let url = URL(string: Constant.ServiceEndPoint.newsServiceEndPoint())
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            if let safeData = data {
                
                print(safeData)
                
                let news = try? JSONDecoder().decode(NewsModel.self, from: safeData)
                
                if let news = news {
                    
                    completion(news.articles)
                }
            }
            
        }.resume()
    }
}
