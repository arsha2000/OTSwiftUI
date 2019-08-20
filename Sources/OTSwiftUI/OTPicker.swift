//
//  OTPicker.swift
//  Notely
//
//  Created by Arsha Hassas on 8/19/19.
//  Copyright © 2019 Olly Taylor. All rights reserved.
//

import SwiftUI

/// A control for selecting from a set of mutually exclusive values.
/// - Parameters:
///  - collection: A collection of data to choose from
///  - selection: A binding value used to report the chosen value
///  - content: A closure from with you should return a view to diplay for each item
/// - Important: You should specify the size of the content you return from the closure.
/// - Important: OTSwiftUI provides a widget called OTCardWidget which is recommended to be used instead of a custom view

@available(iOS 13, *)
public struct OTPicker<DataCollection, Content>: View
where  Content: View, DataCollection: MutableCollection, DataCollection.Element: Identifiable, DataCollection.Index == Int {
    
    public let collection: DataCollection
    @Binding public var selection: DataCollection.Element
    
    @State private var selectedIndex = 0
    private var content: (DataCollection.Element, Bool) -> Content
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<collection.count, id: \.self) { index in
                    self.content(self.collection[index], index == self.selectedIndex)
                        .onTapGesture {
                            self.selectedIndex = index
                            self.selection = self.collection[index]
                    }
                }
            }
        .padding()
        }
    }
    
    public init(_ collection: DataCollection, selection: Binding<DataCollection.Element>, content: @escaping (DataCollection.Element, Bool) -> Content) {
        self.collection = collection
        self._selection = selection
        self.content = content
    }
}

#if DEBUG
struct OTPicker_Previews: PreviewProvider {
    static var previews: some View {
        let collection = ["Note", "Favorite"]
        return OTPicker(collection, selection: .constant(collection[0])) { (text, isSelected) in
            OTCardWidget(isSelected: isSelected, title: text, subtitle: "\(1)")
                .frame(width: 150, height: 170)
            
        }
    }
}

extension String: Identifiable {
    public var id: Int {
        self.hashValue
    }
}
#endif
