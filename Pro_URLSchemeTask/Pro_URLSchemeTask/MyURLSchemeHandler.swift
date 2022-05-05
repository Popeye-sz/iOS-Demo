//
//  MyURLSchemeHandler.swift
//  Pro_URLSchemeTask
//
//  Created by 申政 on 2022/5/6.
//

import Cocoa
import WebKit

class MyURLSchemeHandler: NSObject, WKURLSchemeHandler {
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        print("start urlSchemeTask")
        guard let url = urlSchemeTask.request.url,
                  let fileUrl = fileUrlFromUrl(url),
                  let mimeType = mimeType(ofFileAtUrl: fileUrl),
                  let data = try? Data(contentsOf: fileUrl) else { return }

        let response = URLResponse(url: url,
                                   mimeType: mimeType,
                                   expectedContentLength: data.count,
                                   textEncodingName: nil)

        urlSchemeTask.didReceive(response)
        urlSchemeTask.didReceive(data)
        urlSchemeTask.didFinish()
    }
    
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        print("stop urlSchemeTask")
    }
    
    private func fileUrlFromUrl(_ url: URL?) -> URL? {
        guard let url = url, url.scheme == "myapp" else { return nil }
        if let path = Bundle.main.path(forResource: url.host, ofType: nil) {
            return URL(fileURLWithPath: path)
        }
        return nil
    }
    
    private func mimeType(ofFileAtUrl: URL?) -> String? {
        if let ext = ofFileAtUrl?.pathExtension, ext == "jpg" {
            return "image/jpg"
        }
        return ""
    }
}
