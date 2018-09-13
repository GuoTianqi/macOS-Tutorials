//
//  WordCountViewController.swift
//  BabyScript
//
//  Created by 郭天祈 on 2018/9/13.
//  Copyright © 2018年 郭天祈. All rights reserved.
//

import Cocoa

class WordCountViewController: NSViewController {
    @objc dynamic var wordCount = 0
    @objc dynamic var paragraphCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func dismissWordCountWindow(_ sender: NSButton) {
        let application = NSApplication.shared
        application.stopModal()
    }
}
