//
//  ColorTag.swift
//
//
//  Created by Andrew Farquharson on 09/04/2024.
//
// app.leaf.tags["color"] = ColorTag()

import Leaf

public struct ColorTag: LeafTag {
    public func render(_ ctx: LeafContext) throws -> LeafData {
        guard let colorName = ctx.parameters.first?.string else {
            throw "Unable to convert parameter to string"
        }
        guard let color = Color.forName(colorName) else {
            throw "Color with name \(colorName) not found"
        }
        return LeafData.string(color.rawHexValue)
    }
}

private extension Color {
    static func forName(_ colorName: String) -> Color? {
        switch colorName {
        case "white":
            return .white
        case "black":
            return .black
        case "label":
            return .label
        case "secondaryLabel":
            return .secondaryLabel
        case "tertiaryLabel":
            return .tertiaryLabel
        case "groupedBackground":
            return .groupedBackground
        case "quaternaryLabel":
            return .quaternaryLabel
        case "placeholderText":
            return .placeholderText
        case "separator":
            return .separator
        case "opaqueSeparator":
            return .opaqueSeparator
        case "link":
            return .link
        case "systemBlue", "blue":
            return .systemBlue
        case "systemGreen", "green":
            return .systemGreen
        case "systemIndigo", "indigo":
            return .systemIndigo
        case "systemOrange", "orange":
            return .systemOrange
        case "systemPink", "pink":
            return .systemPink
        case "systemPurple", "purple":
            return .systemPurple
        case "systemRed", "red":
            return .systemRed
        case "systemTeal", "teal":
            return .systemTeal
        case "systemYellow", "yellow":
            return .systemYellow
        case "systemMint", "mint":
            return .systemMint
        case "systemCyan", "cyan":
            return .systemCyan
        case "systemBrown", "brown":
            return .systemBrown
        case "systemGray", "gray":
            return .systemGray
        case "systemGray2":
            return .systemGray2
        case "systemGray3":
            return .systemGray3
        case "systemGray4":
            return .systemGray4
        case "systemGray5":
            return .systemGray5
        case "systemGray6":
            return .systemGray6
        default:
            return nil
        }
    }
}
