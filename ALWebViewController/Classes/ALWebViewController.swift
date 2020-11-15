//
//  ALWebViewController.swift
//  ALWebViewController
//
//  Created by Soner Güler on 7.02.2020.
//

import UIKit
import WebKit

public enum ALWebContentType {
    case url(url: URL)
    case html(html: String)
}

public protocol ALWebViewDelegate: class {
    func webView(didStartLoading webVC: ALWebViewController)
    func webView(didFinishLoading webVC: ALWebViewController)
    func webView(_ webVC: ALWebViewController, didFailWithError error: Error)
}

public extension ALWebViewDelegate {
    func webView(didStartLoading webVC: ALWebViewController) {}
    func webView(didFinishLoading webVC: ALWebViewController) {}
    func webView(_ webVC: ALWebViewController, didFailWithError error: Error) {}
}


open class ALWebViewController: UIViewController {
    
    public var content: ALWebContentType
    
    public var delegate: ALWebViewDelegate?
    
    private var url: URL?
    
    private var htmlString: String?
    
    private var headers: [String: String]?
    
    open lazy var webView: WKWebView = {
        var view = WKWebView()
        view.navigationDelegate = self
        return view
    }()
    
    
    public init(content: ALWebContentType, headers: [String: String]? = nil) {
        self.content = content
        self.headers = headers
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        self.content = .html(html: "")
        super.init(coder: coder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.sizeToFit()
        load()
    }
    
    open func reload() {
        load()
    }
    
    private func load() {
        switch content {
        case .html(let html):
            
            webView.loadHTMLString(html, baseURL: nil)
        case .url(let url):
            var request = URLRequest(url: url)
            headers?.forEach({ (header) in
                request.setValue(header.value, forHTTPHeaderField: header.key)
            })
            webView.load(request)
        }
    }
}

extension ALWebViewController: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        delegate?.webView(didFinishLoading: self)
    }
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        delegate?.webView(didStartLoading: self)
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        delegate?.webView(self, didFailWithError: error)
    }
    
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        delegate?.webView(self, didFailWithError: error)
    }
}
