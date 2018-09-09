//
//  QuotesViewController.swift
//  Quotes
//
//  Created by 郭天祈 on 2018/9/10.
//  Copyright © 2018年 郭天祈. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    @IBOutlet var textLabel: NSTextField!
    
    let quotes = Quote.all
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        currentQuoteIndex = 0
    }
    
    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
}

extension QuotesViewController {
    static func freshController() -> QuotesViewController {
        let stroyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("QuotesViewController")
        
        guard let viewController = stroyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
        }
        
        return viewController
    }
}

extension QuotesViewController {
    @IBAction func previous(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    
    @IBAction func next(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }
}
