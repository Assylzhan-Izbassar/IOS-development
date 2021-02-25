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
        page = newPage
    }
}

class DetailViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    var page: WebPage?
    {
        didSet {
            refreshUI()
        }
    }
    var url: String?
    
    var model = WebPageModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        page = model.getPages().first!
        url = page?.getUrl()
        let request = URLRequest(url: URL(string: url!)!)
        webView.load(request)
    }
    
    private func refreshUI() {
      loadViewIfNeeded()
        print(page?.getTitle() ?? "")
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
