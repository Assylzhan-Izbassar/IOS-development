//
//  WebPageModel.swift
//  BrowserApp
//
//  Created by macbook on 25.02.2021.
//

import Foundation

struct WebPageModel {
    
    private static var pages: Array<WebPage>? = Array<WebPage>()
    private static var favorites: Array<WebPage>? = Array<WebPage>()
    private static var segmentArray = [[WebPage](), [WebPage]()]
    
    init(){
        testData()
    }
    
    mutating func addPage(_ title: String, _ url: String) {
        let newPage = WebPage(title, url)
        WebPageModel.pages?.append(newPage)
        WebPageModel.segmentArray[0] = WebPageModel.pages!
    }
    mutating func addPage(_ newPage: WebPage) {
        WebPageModel.pages?.append(newPage)
        WebPageModel.segmentArray[0] = WebPageModel.pages!
    }
    
    static func getFavor(_ id: Int) -> Bool? {
        return (WebPageModel.pages?[id])?.getFavorite()
    }
    
    func getPages() -> Array<WebPage> {
        return WebPageModel.pages ?? []
    }
    
    static func addFavorite(_ id: Int) {
        WebPageModel.favorites?.append(pages![id])
        pages![id].setFavorite(true)
        updateSegmentArray()
    }
    
    static func deleteFavor(_ id: Int) {
        let title = pages?[id].getTitle()
        var fav_id: Int?
        
        for (i, e) in favorites!.enumerated() {
            if e.getTitle() == title {
                fav_id = i
                break
            }
        }
        
        if let temp = fav_id {
            favorites?.remove(at: temp)
        }
        
        pages![id].setFavorite(false)
        updateSegmentArray()
    }
    
    private static func updateSegmentArray() {
        segmentArray[0] = WebPageModel.pages!
        segmentArray[1] = WebPageModel.favorites!
    }
    
    func getFavorites() -> Array<WebPage> {
        return WebPageModel.pages ?? []
    }
    
    func getSegment() -> [[WebPage]] {
        return WebPageModel.segmentArray
    }
    
    mutating func testData() {
        self.addPage(WebPage("Google", "https://www.google.com"))
        self.addPage(WebPage("Apple", "https://www.apple.com"))
        self.addPage(WebPage("Facebook", "https://www.facebook.com"))
    }
}

