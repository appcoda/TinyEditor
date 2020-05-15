//
//  AppDelegate.swift
//  TinyEditor
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var bgColorMenu: NSMenu?

    @IBOutlet weak var textColorMenu: NSMenu?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBGColorsMenu()
        configureTextColorsMenu()
    }
    
    
    fileprivate func configureBGColorsMenu() {
        AppColors.bgColors.forEach { bgColorMenu?.addItem(withTitle: $0.name, action: #selector(handleBGColorSelection(_:)), keyEquivalent: "")}
    }
    
    
    @objc fileprivate func handleBGColorSelection(_ menuItem: NSMenuItem) {
        let docController = NSDocumentController()
        guard let vc = docController.currentDocument?.windowControllers.first?.contentViewController as? ViewController else { return }
        vc.setBGColor(with: menuItem.title)
    }
    
    
    fileprivate func configureTextColorsMenu() {
        AppColors.textColors.forEach { textColorMenu?.addItem(withTitle: $0.name, action: #selector(handleTextColorSelection(_:)), keyEquivalent: "")}
    }

    @objc fileprivate func handleTextColorSelection(_ menuItem: NSMenuItem) {
        let docController = NSDocumentController()
        guard let vc = docController.currentDocument?.windowControllers.first?.contentViewController as? ViewController else { return }
        vc.setTextColor(with: menuItem.title)
    }
}

