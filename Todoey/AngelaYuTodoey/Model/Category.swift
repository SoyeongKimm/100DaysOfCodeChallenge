//
//  Category.swift
//  AngelaYuTodoey
//
//  Created by Soyeong Kim on 2023/12/18.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
//36. Add a new property
    @objc dynamic var color: String = ""
    let items = List<Item>()
}
