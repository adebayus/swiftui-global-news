//
//  ArticleView.swift
//  GlobalNews
//
//  Created by mymac on 18/09/23.
//

import SwiftUI

struct ArticleView: View {
    
    @State private var searchtext: String = ""
    @StateObject var viewModel: ArticleViewModel = ArticleViewModel()
    @State var isShowWebview: Bool = false
    @State var url: String = ""
    var sourcesId: String
    var sourcesName: String
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                CustomSearchBar(searchText: $searchtext)
                    .padding(.horizontal, 20)
                    .onChange(of: searchtext, perform: { newText in
                        viewModel.getArticlesSource(searchText: newText)
                    })
                
                if viewModel.dataState.isLoading {
                    VStack {
                        Spacer()
                        ProgressView()
                            .frame(width: 60, height: 60)
                        Spacer()
                    }
                } else {
                    if viewModel.dataState.data.isEmpty {
                        VStack {
                            Spacer()
                            Text("Data Not Found")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                    } else {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 20) {
                                ForEach(viewModel.dataState.data, id: \.self) { item in
                                    
                                    NavigationLink(destination: DetailAricleView(url: item.url), label: {
                                        HStack(alignment: .top, spacing: 10) {
                                            
                                            Image("IllustrationMegaphone")
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                            
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(item.title)
                                                    .font(.system(size: 22, weight: .bold))
                                                    .lineLimit(1)
                                                Text(item.description)
                                                    .font(.system(size: 16, weight: .regular))
                                                    .lineLimit(2)
                                                    .foregroundColor(Color.gray.opacity(0.9))
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.top,10)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(10)
                                        .background(.white)
                                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
                                        
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 8)
                                        )
                                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 4)
                                        .onAppear {
                                            let lastData = viewModel.dataState.data.last
                                            print(lastData == item)
                                            if lastData == item && viewModel.isCanContinue {
                                                viewModel.page += 1
                                                viewModel.getArticlesSource(searchText: searchtext, isPagination: true)
                                                print("tesssttt")
                                            }
                                        }
                                    })
                                    
                                    
                                }
                            }
                            .padding(.horizontal, 20)
                            
                        }
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.top, 10)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton(title: sourcesName)
            }
        })
        .onAppear {
            viewModel.setSourcesId(id: sourcesId)
            viewModel.getArticlesSource(searchText: searchtext)
        }
        
    }
}


