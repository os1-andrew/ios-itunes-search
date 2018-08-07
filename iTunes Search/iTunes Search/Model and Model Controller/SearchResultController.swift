//
//  SearchResultController.swift
//  iTunes Search
//
//  Created by Andrew Liao on 8/7/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

private let baseURL = URL(string: "https://itunes.apple.com/search")!

class SearchResultController{
    func performSearch(searchTerm:String, resultType: ResultType, completion: @escaping ()->Void){
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchQueryItem = URLQueryItem(name:"term", value: searchTerm)
        urlComponents.queryItems = [searchQueryItem]
        
        guard let requestURL = urlComponents.url else {
            NSLog("Error creating request URL")
            return
        }
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error{
                NSLog("Error: \(error)")
                _ = completion()
                return
            }
            guard let data = data else {
                NSLog("Error: No data")
                _ = completion()
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.searchResults = try decoder.decode(SearchResults.self, from: data).results
                _ = completion()
            } catch {
                NSLog("Error decoding")
                _ = completion()
                return
            }
            
            
            
            }.resume()
        
        
    }
    
    
    
    var searchResults: [SearchResult] = []
    
}