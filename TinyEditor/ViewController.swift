//
//  ViewController.swift
//  TinyEditor
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear() {
        super.viewWillAppear()

        textView.font = NSFont.systemFont(ofSize: 17.0)
        textView.delegate = self
        
        handleOpenDocumentOperation()
    }
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    func setBGColor(with name: String) {
        textView.backgroundColor = AppColors.bgColors.filter { $0.name == name }.first?.color ?? NSColor.textBackgroundColor
        
        if let colorIndex = AppColors.bgColors.firstIndex(where: { $0.name == name }) {
            (representedObject as? TinyNote)?.bgColorIndex = colorIndex
        }
    }

    
    func setTextColor(with name: String) {
        // Update the text color.
        textView.textColor = AppColors.textColors.filter { $0.name == name }.first?.color ?? NSColor.textColor

        // Update the cursor color!
        textView.insertionPointColor = textView.textColor ?? NSColor.textColor
        
        if let colorIndex = AppColors.textColors.firstIndex(where: { $0.name == name }) {
            (representedObject as? TinyNote)?.textColorIndex = colorIndex
        }
    }
    
    
    func handleOpenDocumentOperation() {
        if let document = self.view.window?.windowController?.document as? Document {
            if document.didReadData {
                populateDocumentContent()
                document.didReadData = false
            }
        }
    }
    
    
    func populateDocumentContent() {
        guard let content = representedObject as? TinyNote else { return }
        textView.string = content.note
        setBGColor(with: AppColors.bgColors[content.bgColorIndex].name)
        setTextColor(with: AppColors.textColors[content.textColorIndex].name)
    }
}


// MARK: - NSTextViewDelegate

extension ViewController: NSTextViewDelegate {
    func textViewDidChangeSelection(_ notification: Notification) {
        (representedObject as? TinyNote)?.note = textView.string
    }
}
