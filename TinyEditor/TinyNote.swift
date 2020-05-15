//
//  TinyNote.swift
//  TinyEditor
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Foundation

class TinyNote: Codable {

    var note = ""

    var bgColorIndex: Int = 0

    var textColorIndex: Int = 1


    // MARK: - Init()

    init() {

    }

    
    func getNoteAsJSON() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    
    func use(data: Data) -> Bool {
        let decoder = JSONDecoder()

        guard let decoded = try? decoder.decode(TinyNote.self, from: data) else {
            // Data was not a JSON.
            // Try to create a String object using it.
            guard let text = String(data: data, encoding: .utf8) else { return false }

            // Data was converted to a string successfully!
            note = text
            return true
        }

        // Data was a JSON and has been decoded successfully!
        note = decoded.note
        bgColorIndex = decoded.bgColorIndex
        textColorIndex = decoded.textColorIndex

        return true
    }

    
    func getNoteText() -> Data? {
        return note.data(using: .utf8)
    }
}
