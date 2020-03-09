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
    
    private lazy var webView: WKWebView = {
        var view = WKWebView()
        view.navigationDelegate = self
        return view
    }()
    
    
    public init(content: ALWebContentType) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        self.content = .html(html: "")
        super.init(coder: coder)
    }
    
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        webView.frame = view.frame
    }
    
    open override func updateViewConstraints() {
        super.updateViewConstraints()
        webView.frame = view.frame
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        load()
    }
    
    public func reload() {
        load()
    }
    
    private func load() {
        switch content {
        case .html(let html):
            webView.loadHTMLString(html, baseURL: nil)
        case .url(let url):
            let request = URLRequest(url: url)
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
