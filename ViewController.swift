//
//  ViewController.swift
//  snaptodoor
//
//  Created by CHEN on 2017/5/31.
//  Copyright © 2017年 jacky. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var wkWebView: WKWebView!
    var popupWebView : WKWebView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let wkWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        wkWebView = WKWebView(frame: view.bounds, configuration: WKWebViewConfiguration())
        if let url = URL(string: "https://snaptodoor.com"){
            let reuqest = URLRequest(url: url)
            wkWebView.load(reuqest)
        }
        
        wkWebView.uiDelegate = self
        wkWebView.navigationDelegate = self
        
        view.addSubview(wkWebView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func webView(_ webView: WKWebView,
                 runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping () -> Void) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let title = NSLocalizedString("OK", comment: "OK Button")
        let ok = UIAlertAction(title: title, style: .default) { (action: UIAlertAction) -> Void in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true)
        completionHandler()
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
    
   
    
    
    
    /*
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
   //webView.load(navigation.request)
        //      wkWebView.evaluateJavaScript("alert('Hello from evaluateJavascript()')", completionHandler: nil)
    }*/
  
    /*
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
      //  wkWebView.evaluateJavaScript("alert('Hello from evaluateJavascript()')", completionHandler: nil)
    }
    */
    
    
   
    
   
}

