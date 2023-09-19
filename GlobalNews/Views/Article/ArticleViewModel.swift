//
//  ArticleViewModel.swift
//  GlobalNews
//
//  Created by mymac on 18/09/23.
//

import Foundation

class ArticleViewModel : ObservableObject {
    
    private var sourcesId: String = ""
    @Published var page: Int = 1
    @Published var dataState: DataState<Article> = DataState()
    @Published var isCanContinue: Bool = true
    
    func getArticlesSource(searchText: String, isPagination: Bool = false) {
        
        if sourcesId == "" {
            return
        }
        
        if !isPagination {
            page = 1
        }
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=\(sourcesId)&page=\(page)&pageSize=10&q=\(searchText)&apiKey=283f0a4489b14ca494c96412ecee6c71") else {
            
            return }
        print("wkwokwo")
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            self.dataState.isLoading = true
            
            do {
                let result = try JSONDecoder().decode(ArticleResponse.self, from: data!)
                
                DispatchQueue.main.async {
                    if isPagination {
                        var oldData = self.dataState.data
                        oldData.append(contentsOf: result.articles)
                        self.dataState.data = oldData
                    } else {
                        self.dataState.data = result.articles
                    }
                    
                    
                    self.dataState.isError = false
                    self.dataState.isLoading = false
                    self.isCanContinue = result.articles.count == 10
                }
                
                print(result, "ress")
            } catch {
                self.dataState.isError = true
                self.dataState.message = "\(error.localizedDescription)"
                self.dataState.isLoading = false
                print(error, "resserrror")
            }
        }.resume()
    }
    
    func setSourcesId(id: String) {
        sourcesId = id
    }
}

struct Article: Codable, Hashable {
    var author: String?
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var source: ArticleSource
}

struct ArticleResponse: Codable, Hashable {
    var status: String
    var totalResults: Int?
    var articles: [Article] = []
    
}

struct ArticleSource: Codable, Hashable {
    var id: String
    var name: String
}
