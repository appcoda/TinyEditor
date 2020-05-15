//
//  AppColors.swift
//  TinyEditor
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Cocoa

struct AppColors {
    static let bgColors: [(name: String, color: NSColor)] = [
        ("Default", NSColor.textBackgroundColor),
        ("Blue", NSColor(named: "blue") ?? NSColor.black),
        ("Yellow", NSColor(named: "yellow") ?? NSColor.black),
        ("Pink", NSColor(named: "pink") ?? NSColor.black),
        ("Teal", NSColor(named: "teal") ?? NSColor.black)]
    
    
    static let textColors: [(name: String, color: NSColor)] = [
        ("Dark", NSColor.black),
        ("Light", NSColor.white)]
}
