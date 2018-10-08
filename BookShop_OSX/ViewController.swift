/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var topStack: NSStackView!
    @IBOutlet weak var tableView: NSTableView!

    @IBOutlet weak var coverImageView: NSImageView!
    @IBOutlet weak var titleTextField: NSTextField!
    @IBOutlet weak var editionTextFild: NSTextField!
    @IBOutlet weak var buyNoeButton: NSButton!
    
    let books = Book.all()

    @IBAction func actionToggleListView(sender: AnyObject) {
        if let button = sender as? NSToolbarItem {
            switch button.tag {
            case 0:
                button.tag = 1
                button.image = NSImage(named: "list-selected-icon")
            case 1:
                button.tag = 0
                button.image = NSImage(named: "list-icon")
            default: break
            }

            // toggle the side bar visibility
            NSAnimationContext.runAnimationGroup({ context in
                //configure the animation context
                context.duration = 0.25
                context.allowsImplicitAnimation = true
                
                // perform the animation
                self.topStack.arrangedSubviews.first!.isHidden = button.tag == 0 ? true : false
                self.view.layoutSubtreeIfNeeded()
            }, completionHandler: nil)
        }
    }
}

//
//  Starter code
//
extension ViewController {

    override func viewWillAppear() {
        super.viewWillAppear()

        if let window = view.window {
            window.titleVisibility = .hidden
            window.titlebarAppearsTransparent = true
            window.isMovableByWindowBackground = true
        }
        view.wantsLayer = true
        view.layer!.backgroundColor = NSColor(calibratedWhite: 0.95, alpha: 1).cgColor

        tableView.selectRowIndexes(IndexSet(integer: 0), byExtendingSelection: false)
        displayBookDetails(book: books[tableView.selectedRow])
    }

    func displayBookDetails(book: Book) {
        coverImageView.image = NSImage(named: book.cover)
        titleTextField.stringValue = book.title
        editionTextFild.stringValue = book.edition
    }

    @IBAction func actionBuySelectedBook(sender: AnyObject) {
        let book = books[tableView.selectedRow]
        NSWorkspace.shared.open(book.url as URL)
    }
}

//
//  Table view code
//
extension ViewController: NSTableViewDataSource, NSTableViewDelegate {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return books.count
    }

    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "BookCell"), owner: self) as! BookCellView
        let book = books[row]

        cell.coverImage.image = NSImage(named: book.thumb)
        cell.bookTitle.stringValue = book.title

        return cell
    }

    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        displayBookDetails(book: books[row])
        return true
    }
}
