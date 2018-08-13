//
//  TemperatureTests.swift
//  UnitlessTests
//
//  Created by Tomás Silveira Salles on 13.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import XCTest
@testable import Unitless

fileprivate enum Helper {
	static let celsiusAbsoluteZero: Double = -273.15
	static let fahrenheitAbsoluteZero: Double = -459.67
	static let fahrenheitToKelvinWaterSpanRatio: Double = 9.0 / 5.0
	
	static func kelvinToCelsius(_ kelvinValue: Double) -> Double {
		return kelvinValue + celsiusAbsoluteZero
	}
	
	static func celsiusToKelvin(_ celsiusValue: Double) -> Double {
		return celsiusValue - celsiusAbsoluteZero
	}

	static func kelvinToFahrenheit(_ kelvinValue: Double) -> Double {
		return kelvinValue * fahrenheitToKelvinWaterSpanRatio + fahrenheitAbsoluteZero
	}
	
	static func fahrenheitToKelvin(_ fahrenheitValue: Double) -> Double {
		return (fahrenheitValue - fahrenheitAbsoluteZero) / fahrenheitToKelvinWaterSpanRatio
	}
	
	static func celsiusToFahrenheit(_ celsiusValue: Double) -> Double {
		return kelvinToFahrenheit(celsiusToKelvin(celsiusValue))
	}
	
	static func fahrenheitToCelsius(_ fahrenheitValue: Double) -> Double {
		return kelvinToCelsius(fahrenheitToKelvin(fahrenheitValue))
	}
}

class TemperatureTests<T: Temperature> {
	func testInitializers() {
		XCTAssertNotNil(T(kelvin: 42.0))
		XCTAssertNotNil(T(kelvin: 0.0))
		XCTAssertNil(T(kelvin: -0.01))
		
		XCTAssertNotNil(T(celsius: 42.0))
		XCTAssertNotNil(T(celsius: -273.15))
		XCTAssertNil(T(celsius: -273.16))
		
		XCTAssertNotNil(T(fahrenheit: 42.0))
		XCTAssertNotNil(T(fahrenheit: -459.67))
		XCTAssertNil(T(fahrenheit: -459.68))
	}
	
	func testConversionsFromKelvin() {
		let temperature1 = T(kelvin: 42.0)
		XCTAssertEqual(temperature1?.kelvin, 42.0)
		XCTAssertEqual(temperature1?.celsius, Helper.kelvinToCelsius(42.0))
		XCTAssertEqual(temperature1?.fahrenheit, Helper.kelvinToFahrenheit(42.0))
		
		let temperature2 = T(kelvin: 0.0)
		XCTAssertEqual(temperature2?.kelvin, 0.0)
		XCTAssertEqual(temperature2?.celsius, Helper.kelvinToCelsius(0.0))
		XCTAssertEqual(temperature2?.fahrenheit, Helper.kelvinToFahrenheit(0.0))
	}
	
	func testConversionsFromCelsius() {
		let temperature1 = T(celsius: 42.0)
		XCTAssertEqual(temperature1?.kelvin, Helper.celsiusToKelvin(42.0))
		XCTAssertEqual(temperature1?.celsius, 42.0)
		XCTAssertEqual(temperature1?.fahrenheit, Helper.celsiusToFahrenheit(42.0))
		
		let temperature2 = T(celsius: -99.0)
		XCTAssertEqual(temperature2?.kelvin, Helper.celsiusToKelvin(-99.0))
		XCTAssertEqual(temperature2?.celsius, -99.0)
		XCTAssertEqual(temperature2?.fahrenheit, Helper.celsiusToFahrenheit(-99.0))
		
		let temperature3 = T(celsius: -273.15)
		XCTAssertEqual(temperature3?.kelvin, Helper.celsiusToKelvin(-273.15))
		XCTAssertEqual(temperature3?.celsius, -273.15)
		XCTAssertEqual(temperature3?.fahrenheit, Helper.celsiusToFahrenheit(-273.15))
	}
	
	func testConversionsFromFahrenheit() {
		let temperature1 = T(fahrenheit: 42.0)
		XCTAssertEqual(temperature1?.kelvin, Helper.fahrenheitToKelvin(42.0))
		XCTAssertEqual(temperature1?.celsius, Helper.fahrenheitToCelsius(42.0))
		XCTAssertEqual(temperature1?.fahrenheit, 42.0)
		
		let temperature2 = T(fahrenheit: -99.0)
		XCTAssertEqual(temperature2?.kelvin, Helper.fahrenheitToKelvin(-99.0))
		XCTAssertEqual(temperature2?.celsius, Helper.fahrenheitToCelsius(-99.0))
		XCTAssertEqual(temperature2?.fahrenheit, -99.0)
		
		let temperature3 = T(fahrenheit: -459.67)
		XCTAssertEqual(temperature3?.kelvin, Helper.fahrenheitToKelvin(-459.67))
		XCTAssertEqual(temperature3?.celsius, Helper.fahrenheitToCelsius(-459.67))
		XCTAssertEqual(temperature3?.fahrenheit, -459.67)
	}
}
