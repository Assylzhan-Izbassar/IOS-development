//
//  WebPage.swift
//  BrowserApp
//
//  Created by macbook on 25.02.2021.
//

class WebPage {
    
    private var title: String
    private var url: String
    private var isFavorite: Bool?
    
    init(_ title: String, _ url: String){
        self.title = title
        self.url = url
        self.isFavorite = false
    }
    
    convenience init(_ title: String, _ url: String, _ isFavorite: Bool){
        self.init(title, url)
        self.isFavorite = isFavorite
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func getUrl() -> String {
        return self.url
    }
    
    func getFavorite() -> Bool {
        return self.isFavorite ?? false
    }
}
