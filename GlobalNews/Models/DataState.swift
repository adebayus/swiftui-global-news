//
//  DataState.swift
//  GlobalNews
//
//  Created by mymac on 18/09/23.
//

import  Foundation


struct DataState<T> {
    var isLoading: Bool = true
    var isError: Bool = false
    var data: [T] = []
    var message: String? = ""
}

