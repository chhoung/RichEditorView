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
    
    init() {}
    
    init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let textWrapScriptString = """
                    var style = document.createElement('style');
                    style.textContent = 'body { word-wrap: break-word; overflow-wrap: break-word; width: 100%; margin: 0; padding: 10px; } .editable { max-width: 100%; white-space: pre-wrap; }';
                    document.getElementsByTagName('head')[0].appendChild(style);
                """
        
        let textWrapScript = WKUserScript(source: textWrapScriptString, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        self.configuration.userContentController.addUserScript(textWrapScript)
    }
}
