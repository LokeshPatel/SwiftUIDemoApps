//
//  NoteModel.swift
//  SwiftDataDemo
//
//  Created by Ani on 06/05/25.
//

import Foundation
import SwiftData

@Model
class Note {
    var title : String
    init(title: String) {
        self.title = title
    }
}
