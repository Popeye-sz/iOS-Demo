//
//  ViewController.swift
//  Pro_URLSchemeTask
//
//  Created by 申政 on 2022/5/5.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    var webView: WKWebView?
    
    var urlSchemeHandler: MyURLSchemeHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlSchemeHandler = MyURLSchemeHandler()
        let config = WKWebViewConfiguration()
        config.setURLSchemeHandler(urlSchemeHandler, forURLScheme: "myapp")
        
        webView = WKWebView(frame: view.bounds, configuration: config)
        webView?.autoresizingMask = [.width, .height]
        view.addSubview(webView!)
        //webView?.load(URLRequest(url: URL(string: "https://www.baidu.com")!))
        let path = Bundle.main.path(forResource:"index", ofType: "html")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            webView?.load(URLRequest(url: url))
        }
    }
    
}
