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

class DetailViewController: UINavigationController, WKUIDelegate {
    
    @IBOutlet var webView: WKWebView!
    var url: String?
    var page: WebPage? {
        didSet {
            refreshUI()
        }
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func refreshUI() {
        loadViewIfNeeded()
        
        url = page?.getUrl()
        let request = URLRequest(url: URL(string: url!)!)
        print(webView.load(request)!)
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
