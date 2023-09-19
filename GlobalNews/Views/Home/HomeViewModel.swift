//
//  HomeViewModel.swift
//  GlobalNews
//
//  Created by mymac on 17/09/23.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var categories: [Category] = [
        .init(name: "Business", nameColor: "CadetBlue"),
        .init(name: "Entertaiment", nameColor: "DarkPastelBlue"),
        .init(name: "General", nameColor: "JetStream"),
        .init(name: "Health", nameColor: "PastelBlue"),
        .init(name: "Science", nameColor: "PastelRed"),
        .init(name: "Technology", nameColor: "WildBlueYonder"),
        .init(name: "Sports", nameColor: "CadetBlue")
        
    ]
    
    
}


/*
 
 "Business",
 "Entertaiment",
 "General",
 "Health",
 "Science",
 "Sports",
 "Technology"
 
 
 */
