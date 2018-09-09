//
//  AppDelegate.swift
//  Quotes
//
//  Created by 郭天祈 on 2018/9/9.
//  Copyright © 2018年 郭天祈. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.target = self
            button.action = #selector(AppDelegate.togglePopover(_:))
        }
        popover.contentViewController = QuotesViewController.freshController()
        // construcMenu()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func printQuote(_ sender: Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) - \(quoteAuthor)")
    }
    
    func construcMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(AppDelegate.printQuote(_:)), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.maxY)
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
}

