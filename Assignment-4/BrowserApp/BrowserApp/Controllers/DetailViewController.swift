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

protocol TableRefreshDelegate: class {
    func tableRefresh()
    func changeColor(_ status: Bool)
}

class DetailViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet weak var activeLogo: UIActivityIndicatorView!
    
    var page: WebPage? {
        didSet {
            refreshUI()
        }
    }
    weak var refresh: TableRefreshDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         Block for recognize 3 taps
         */
        let tap = UITapGestureRecognizer(target: self, action: #selector(taps))
        tap.numberOfTapsRequired = 3
        webView.addGestureRecognizer(tap)
    }

    private func refreshUI() {

        loadViewIfNeeded()
        let request = URLRequest(url: URL(string: (page?.getUrl())!)!)
        webView.load(request)
        
        webView.addSubview(activeLogo)
        activeLogo.startAnimating()
        webView.navigationDelegate = self
        activeLogo.hidesWhenStopped = true
        
        if page?.getFavorite() == true {
            navigationController?.navigationBar.barTintColor = .yellow
            refresh?.changeColor(true)
        } else {
            navigationController?.navigationBar.barTintColor = .white
            refresh?.changeColor(false)
        }
        
        self.title = page?.getTitle()
    }
    
    @objc func taps() {
        if WebPageModel.getFavor((page?.getId())!) == false {
            WebPageModel.addFavorite((page?.getId())!)
        } else {
            WebPageModel.deleteFavor((page?.getId())!)
        }
        if page?.getFavorite() == true {
            navigationController?.navigationBar.barTintColor = .yellow
            refresh?.changeColor(true)
        } else {
            navigationController?.navigationBar.barTintColor = .white
            refresh?.changeColor(false)
        }
        refresh?.tableRefresh()
    }
   
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activeLogo.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activeLogo.stopAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        refresh?.changeColor(false)
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
