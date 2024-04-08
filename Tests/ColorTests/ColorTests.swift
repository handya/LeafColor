import XCTest
@testable import Color

final class VaporToolKitTests: XCTestCase {
    func testInitialization() {
        let colorWithoutHash = Color("123456")
        XCTAssertEqual(colorWithoutHash.rawHexValue, "#123456")

        let colorWithHash = Color("#654321")
        XCTAssertEqual(colorWithHash.rawHexValue, "#654321")
    }

    func testRawHexValue() {
        let color = Color("abcdef")
        XCTAssertEqual(color.rawHexValue, "#abcdef")
    }

    func testAlphaComponent() {
        let baseColor = Color("112233")
        let colorWithAlpha = baseColor.withAlphaComponent(50)
        XCTAssertEqual(colorWithAlpha.rawHexValue, "#11223331ce")

        let colorWithFullAlpha = baseColor.withAlphaComponent(100)
        XCTAssertEqual(colorWithFullAlpha.rawHexValue, "#112233639c")

        let colorWithNoAlpha = baseColor.withAlphaComponent(0)
        XCTAssertEqual(colorWithNoAlpha.rawHexValue, "#11223300")
    }

    func testPredefinedColors() {
        XCTAssertEqual(Color.white.rawHexValue, "#ffffff")
        // TODO: Add assertions for other predefined colors as needed
    }

    func testEncodeDecode() throws {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()

        let color = Color("abcdef")
        let encodedData = try encoder.encode(color)
        let decodedColor = try decoder.decode(Color.self, from: encodedData)

        XCTAssertEqual(decodedColor.rawHexValue, "#abcdef")
    }

    static var allTests = [
        ("testInitialization", testInitialization),
        ("testRawHexValue", testRawHexValue),
        ("testAlphaComponent", testAlphaComponent),
        ("testPredefinedColors", testPredefinedColors),
        ("testEncodeDecode", testEncodeDecode)
    ]
}
