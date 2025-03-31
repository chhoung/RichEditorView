//
//  RichEditorWebView.swift
//  RichEditorView
//
//  Created by C. Bess on 9/18/19.
//

import WebKit

public class RichEditorWebView: WKWebView {

    public var accessoryView: UIView?
    
    public override var inputAccessoryView: UIView? {
        return accessoryView
    }
    
    // Programmatic initializer with default configuration
    public init(frame: CGRect = .zero) {
        let configuration = WKWebViewConfiguration()
        
        // Text wrapping script
        let textWrapScriptString = """
                var style = document.createElement('style');
                style.textContent = 'body { word-wrap: break-word; overflow-wrap: break-word; width: 100%; margin: 0; padding: 10px; } .editable { max-width: 100%; white-space: pre-wrap; }';
                document.getElementsByTagName('head')[0].appendChild(style);
            """
        let textWrapScript = WKUserScript(source: textWrapScriptString, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        // Viewport script
        let viewportScriptString = """
                var meta = document.createElement('meta');
                meta.name = 'viewport';
                meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
                document.getElementsByTagName('head')[0].appendChild(meta);
            """
        let viewportScript = WKUserScript(source: viewportScriptString, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        configuration.userContentController.addUserScript(textWrapScript)
        configuration.userContentController.addUserScript(viewportScript)
        
        super.init(frame: frame, configuration: configuration)
    }
    
    // Storyboard/NIB initializer
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        // Apply the same scripts as above
        let textWrapScriptString = """
                var style = document.createElement('style');
                style.textContent = 'body { word-wrap: break-word; overflow-wrap: break-word; width: 100%; margin: 0; padding: 10px; } .editable { max-width: 100%; white-space: pre-wrap; }';
                document.getElementsByTagName('head')[0].appendChild(style);
            """
        let textWrapScript = WKUserScript(source: textWrapScriptString, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        let viewportScriptString = """
                var meta = document.createElement('meta');
                meta.name = 'viewport';
                meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
                document.getElementsByTagName('head')[0].appendChild(meta);
            """
        let viewportScript = WKUserScript(source: viewportScriptString, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        self.configuration.userContentController.addUserScript(textWrapScript)
        self.configuration.userContentController.addUserScript(viewportScript)
    }
}
