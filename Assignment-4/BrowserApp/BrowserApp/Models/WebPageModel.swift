//
//  WebPageModel.swift
//  BrowserApp
//
//  Created by macbook on 25.02.2021.
//

import Foundation

struct WebPageModel {
    
    private var pages: Array<WebPage>? = Array<WebPage>()
    
    init(){
        testData()
    }
    
    func getPages() -> Array<WebPage> {
        return self.pages ?? []
    }
    
    mutating func testData() {
        pages?.append(WebPage("Google", "https://google.com"))
        pages?.append(WebPage("Apple", "https://apple.com"))
        pages?.append(WebPage("Facebook", "https://facebook.com"))
    }
}

