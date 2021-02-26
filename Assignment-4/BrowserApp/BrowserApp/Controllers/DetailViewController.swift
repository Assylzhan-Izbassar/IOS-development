//
//  DetailViewController.swift
//  BrowserApp
//
//  Created by macbook on 26.02.2021.
//

import Foundation
import UIKit
import WebKit

extension DetailViewController: WebSelectionDelegate {
    func webSelected(_ newPage: WebPage) {
        self.page = newPage
    }
}

class DetailViewController: UINavigationController, WKNavigationDelegate {
    

//    @IBOutlet var webView: WKWebView!
//    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    @IBOutlet weak var detailNav: UINavigationItem!
    var url: String?
    var page: WebPage? {
        didSet {
            refreshUI()
        }
    }
    var pageId: Int?
    
    var touchCount: Int = 0
    
//    override func loadView() {
//        webView = WKWebView()
//        webView.navigationDelegate = self
//        view = webView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if let path = url {
//            let request = URLRequest(url: URL(string: path)!)
//            webView.load(request)
//        }
    }
    
    private func refreshUI() {
        loadViewIfNeeded()
        url = page?.getUrl()
        pageId = page?.getId()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchCount += 1
        if touchCount == 3 {
            if WebPageModel.getFavor(pageId!) == false {
                WebPageModel.addFavorite(pageId!)
            } else {
                WebPageModel.deleteFavor(pageId!)
            }
            touchCount = 0
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
