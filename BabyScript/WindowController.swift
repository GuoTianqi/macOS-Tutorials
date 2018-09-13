//
//  WindowController.swift
//  BabyScript
//
//  Created by 郭天祈 on 2018/9/11.
//  Copyright © 2018年 郭天祈. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
    }
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        if let window = window, let screen = window.screen {
            let offsetFromLeftOfScreen: CGFloat = 100
            let offsetFromTopOfScreen: CGFloat = 100
            
            let screenRect = screen.visibleFrame
            
            let newOriginY = screenRect.maxY - window.frame.height - offsetFromTopOfScreen
            
            window.setFrameOrigin(NSPoint(x: offsetFromLeftOfScreen, y: newOriginY))
        }
    }

}
