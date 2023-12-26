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
    let items = List<Item>()
}
