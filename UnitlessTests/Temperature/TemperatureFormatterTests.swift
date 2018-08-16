//
//  TemperatureFormatterTests.swift
//  UnitlessTests
//
//  Created by Tomás Silveira Salles on 15.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import XCTest
@testable import Unitless

class TemperatureFormatterTests: XCTestCase {
	let numberFormatter: NumberFormatter = {
		var result = NumberFormatter()
		result.numberStyle = .decimal
		result.localizesFormat = false
		result.roundingMode = .halfUp
		result.minimumFractionDigits = 5
		return result
	}()
	
	func testFormatKelvin() {
		guard let temperature = Temperature(kelvin: 42.0) else {
			XCTFail("Could not initialize Temperature value.")
			return
		}
		
		let formatter = TemperatureFormatter(format: .kelvin, numberFormatter: numberFormatter)
		XCTAssertEqual(formatter.toString(temperature),
					   numberFormatter.string(from: NSNumber(value: temperature.kelvin)).map({ $0 + " K"}))
	}
	
	func testFormatCelsius() {
		guard let temperature = Temperature(kelvin: 42.0) else {
			XCTFail("Could not initialize Temperature value.")
			return
		}
		
		let formatter = TemperatureFormatter(format: .celsius, numberFormatter: numberFormatter)
		XCTAssertEqual(formatter.toString(temperature),
					   numberFormatter.string(from: NSNumber(value: temperature.celsius)).map({ $0 + " °C"}))
	}
	
	func testFormatFahrenheit() {
		guard let temperature = Temperature(kelvin: 42.0) else {
			XCTFail("Could not initialize Temperature value.")
			return
		}
		
		let formatter = TemperatureFormatter(format: .fahrenheit, numberFormatter: numberFormatter)
		XCTAssertEqual(formatter.toString(temperature),
					   numberFormatter.string(from: NSNumber(value: temperature.fahrenheit)).map({ $0 + " °F"}))
	}
}
