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
	func testFormatKelvin() {
		guard let temperature = Temperature(kelvin: 42.0) else {
			XCTFail("Could not initialize Temperature value.")
			return
		}
		
		let formatter = TemperatureFormatter(format: .kelvin)
		XCTAssertEqual(formatter.toString(temperature), "\(temperature.kelvin) K")
	}
	
	func testFormatCelsius() {
		guard let temperature = Temperature(kelvin: 42.0) else {
			XCTFail("Could not initialize Temperature value.")
			return
		}
		
		let formatter = TemperatureFormatter(format: .celsius)
		XCTAssertEqual(formatter.toString(temperature), "\(temperature.celsius) °C")
	}
	
	func testFormatFahrenheit() {
		guard let temperature = Temperature(kelvin: 42.0) else {
			XCTFail("Could not initialize Temperature value.")
			return
		}
		
		let formatter = TemperatureFormatter(format: .fahrenheit)
		XCTAssertEqual(formatter.toString(temperature), "\(temperature.fahrenheit) °F")
	}
}
