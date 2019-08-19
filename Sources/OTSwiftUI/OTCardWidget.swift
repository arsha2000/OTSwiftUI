//
//  OTCardWidget.swift
//  Notely
//
//  Created by Arsha Hassas on 8/18/19.
//  Copyright © 2019 Olly Taylor. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
public struct OTCardWidget: View {
    
    public let isSelected: Bool
    public let title: String
    public let subtitle: String
    public var color: Color = .blue
    
    @Environment(\.colorScheme) private var colorScheme
    private var colors: Colors { Colors(colorScheme, color: color) }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .fill(isSelected ? colors.selectedRectColor : colors.rectColor)
                .shadow(radius: 2, y: 1)
            
        
            VStack(alignment: .leading) {
                CustomText(title)
                    .font(.roundedTitle)
                    
                
                Spacer()
                
                CustomText(subtitle)
                    .font(.monospacedTitle)
                    
            }
        .padding()
        }
        .animation(Animation.easeOut.speed(2))
        .scaleEffect(isSelected ? 1.1 : 1)
    }

    
    private func CustomText(_ string: String) -> Text {
        Text(string)
            .foregroundColor(isSelected ? colors.selectedTextColor : colors.textColor)
        
    }
}

extension OTCardWidget {
    private struct Colors {
        let textColor: Color
        let selectedTextColor: Color
        let rectColor: Color
        let selectedRectColor: Color
        
        init(_ colorScheme: ColorScheme, color: Color) {
            switch colorScheme {
            case .light:
                self.textColor = .primary
                self.selectedTextColor = .white
                self.rectColor = .white
                self.selectedRectColor = color
            case .dark:
                self.textColor = .primary
                self.selectedTextColor = .primary
                self.rectColor = Color.white.opacity(0.2)
                self.selectedRectColor = color
                
            @unknown default:
                fatalError()
            }
        }
    }
}

#if DEBUG
struct CardWidget_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            HStack(spacing: 20) {
                ForEach([true, false], id: \.self) { isSelected in
                    OTCardWidget(isSelected: isSelected, title: "Notes", subtitle: "13")
                        .frame(width: 150, height: 170)
                }
            }
        .environment(\.colorScheme, colorScheme)
        .previewDisplayName("\(colorScheme)")
        }
    }
}
#endif


