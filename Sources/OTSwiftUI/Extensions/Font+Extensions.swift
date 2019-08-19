//
//  Font+Extensions.swift
//  Notely
//
//  Created by Arsha Hassas on 8/19/19.
//  Copyright © 2019 Olly Taylor. All rights reserved.
//

import SwiftUI

extension Font {
    static let roundedLargeTitle = Font.system(.largeTitle, design: .rounded).bold()
    static let roundedTitle = Font.system(.title, design: .rounded).bold()
    static let monospacedTitle = Font.system(.title, design: .monospaced).bold()
}
