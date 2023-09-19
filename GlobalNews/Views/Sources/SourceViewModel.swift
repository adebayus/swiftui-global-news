//
//  SourceViewModel.swift
//  GlobalNews
//
//  Created by mymac on 18/09/23.
//

import Foundation

class SourceViewModel : ObservableObject {
    
    @Published private var rawSource: [Source] = []
    @Published var dataState: DataState<Source> = DataState()
    
    func getSources(category: String) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines/sources?category=\(category)&apiKey=283f0a4489b14ca494c96412ecee6c71") else { return }
        self.dataState.isLoading = true
        URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            do {
                let result = try JSONDecoder().decode(SourceResponse.self, from: data!)
                DispatchQueue.main.async {
                    self.rawSource = result.sources
                    self.dataState.data = result.sources
                    self.dataState.isError = false
                    self.dataState.isLoading = false
//                    print(result, "resss")
                }
            } catch {
                print(error, "iniresulte")
                self.dataState.isError = true
                self.dataState.message = "\(error.localizedDescription)"
                self.dataState.isLoading = false
            }
        }).resume()
    }
    
    func getSearchSources(searchText: String) {
        dataState.isLoading = true
        
        if searchText != "" {
            let filterData = rawSource.filter { $0.name.contains(searchText) }
            dataState.data = filterData
        } else {
            dataState.data = rawSource
        }
        
        dataState.isLoading = false
    }
    
}
