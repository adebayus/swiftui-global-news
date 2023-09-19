//
//  SourcesView.swift
//  GlobalNews
//
//  Created by mymac on 18/09/23.
//

import SwiftUI
import Combine

struct SourcesView: View {
    
    @ObservedObject var viewModel: SourceViewModel = SourceViewModel()
    @State private var searchtext: String = ""
    @State private var isDidLoad: Bool = false
    
    
    var categoryId: String
    
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                
                CustomSearchBar(searchText: $searchtext)
                    .padding(.horizontal, 20)
                    .onChange(of: searchtext, perform: { newText in
                        viewModel.getSearchSources(searchText: newText)
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
                                ForEach(viewModel.dataState.data, id: \.id) { item in
                                    
                                    NavigationLink(
                                        destination: ArticleView(sourcesId: item.id, sourcesName: item.name),
                                        label: {
                                            HStack(alignment: .top, spacing: 10) {
                                                
                                                Image("IllustrationMegaphone")
                                                    .resizable()
                                                    .frame(width: 80, height: 80)
                                                
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text(item.name)
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
                                        }
                                    )
                                    
                                    
                                    
                                }
                            }
                            .padding(.horizontal, 20)
                            
                        }
                    }
                }
            }
            .padding(.top, 10)
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButton(title: "List Sources")
                }
            })
            .onAppear {
                if !isDidLoad {
                    isDidLoad = true
                    viewModel.getSources(category: categoryId)
                }
            }
        }
        .toast(isPresented: $viewModel.dataState.isError, message: viewModel.dataState.message ?? "Something Wrong", duration: 3)
    }
    
}

//struct SourcesView_Previews: PreviewProvider {
//    static var previews: some View {
//        SourcesView()
//    }
//}
