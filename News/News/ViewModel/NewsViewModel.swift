//
//  NewsViewModel.swift
//  News
//
//  Created by Apple on 19.09.2023.
//

import Foundation

//MARK: - NewsListViewModel

struct NewsListViewModel {
    
    let newsList : [Article]
}

extension NewsListViewModel {
    
    func numberOfSection(_ section : Int) -> Int {
        return newsList.count
    }
    
    func newsAtIndex(_ index : Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
}

//MARK: - NewsViewModel

struct NewsViewModel {
    
    let news : Article
}

extension NewsViewModel {
    
    var title : String {
        return news.title
    }
    
    var description : String {
        guard let descript = news.description else { return "" }
        return descript
    }
    
    var url : String {
        return news.url
    }
    
    var urlToImage : String {
        guard let image = news.urlToImage else { return "" }
        return image
    }
    
    var pusblisedAt : String {
        return news.publishedAt
    }
    
}   
