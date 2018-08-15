//
//  TemperatureProtocolTests.swift
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

class TemperatureImplementationTests<T: TemperatureProtocol> {
	let message = "Implementation: \(T.self)"
	let accuracy = 1e-13
	
	// MARK: Test initializers
	
	func testInitializers() {
		XCTAssertNotNil(T(kelvin: 42.0), message)
		XCTAssertNotNil(T(kelvin: 0.0), message)
		XCTAssertNil(T(kelvin: -0.001), message)
		
		XCTAssertNotNil(T(celsius: 42.0), message)
		XCTAssertNotNil(T(celsius: -273.15), message)
		XCTAssertNil(T(celsius: -273.151), message)
		
		XCTAssertNotNil(T(fahrenheit: 42.0), message)
		XCTAssertNotNil(T(fahrenheit: -459.67), message)
		XCTAssertNil(T(fahrenheit: -459.671), message)
	}
	
	// MARK: Test conversions
	
	func testConversionsFromKelvin() {
		guard
			let temperature1 = T(kelvin: 42.0),
			let temperature2 = T(kelvin: 0.0)
		else {
			XCTFail("Could not initialize temperature values. " + message)
			return
		}
		
		XCTAssertEqual(temperature1.kelvin, 42.0, accuracy: accuracy, message)
		XCTAssertEqual(temperature1.celsius, Helper.kelvinToCelsius(42.0), accuracy: accuracy, message)
		XCTAssertEqual(temperature1.fahrenheit, Helper.kelvinToFahrenheit(42.0), accuracy: accuracy, message)
		
		XCTAssertEqual(temperature2.kelvin, 0.0, accuracy: accuracy, message)
		XCTAssertEqual(temperature2.celsius, Helper.kelvinToCelsius(0.0), accuracy: accuracy, message)
		XCTAssertEqual(temperature2.fahrenheit, Helper.kelvinToFahrenheit(0.0), accuracy: accuracy, message)
	}
	
	func testConversionsFromCelsius() {
		guard
			let temperature1 = T(celsius: 42.0),
			let temperature2 = T(celsius: -99.0),
			let temperature3 = T(celsius: -273.15)
		else {
			XCTFail("Could not initialize temperature values. " + message)
			return
		}
		
		XCTAssertEqual(temperature1.kelvin, Helper.celsiusToKelvin(42.0), accuracy: accuracy, message)
		XCTAssertEqual(temperature1.celsius, 42.0, accuracy: accuracy, message)
		XCTAssertEqual(temperature1.fahrenheit, Helper.celsiusToFahrenheit(42.0), accuracy: accuracy, message)
		
		XCTAssertEqual(temperature2.kelvin, Helper.celsiusToKelvin(-99.0), accuracy: accuracy, message)
		XCTAssertEqual(temperature2.celsius, -99.0, accuracy: accuracy, message)
		XCTAssertEqual(temperature2.fahrenheit, Helper.celsiusToFahrenheit(-99.0), accuracy: accuracy, message)
		
		XCTAssertEqual(temperature3.kelvin, Helper.celsiusToKelvin(-273.15), accuracy: accuracy, message)
		XCTAssertEqual(temperature3.celsius, -273.15, accuracy: accuracy, message)
		XCTAssertEqual(temperature3.fahrenheit, Helper.celsiusToFahrenheit(-273.15), accuracy: accuracy, message)
	}
	
	func testConversionsFromFahrenheit() {
		guard
			let temperature1 = T(fahrenheit: 42.0),
			let temperature2 = T(fahrenheit: -99.0),
			let temperature3 = T(fahrenheit: -459.67)
		else {
			XCTFail("Could not initialize temperature values. " + message)
			return
		}
		
		XCTAssertEqual(temperature1.kelvin, Helper.fahrenheitToKelvin(42.0), accuracy: accuracy, message)
		XCTAssertEqual(temperature1.celsius, Helper.fahrenheitToCelsius(42.0), accuracy: accuracy, message)
		XCTAssertEqual(temperature1.fahrenheit, 42.0, accuracy: accuracy, message)
		
		XCTAssertEqual(temperature2.kelvin, Helper.fahrenheitToKelvin(-99.0), accuracy: accuracy, message)
		XCTAssertEqual(temperature2.celsius, Helper.fahrenheitToCelsius(-99.0), accuracy: accuracy, message)
		XCTAssertEqual(temperature2.fahrenheit, -99.0, accuracy: accuracy, message)
		
		XCTAssertEqual(temperature3.kelvin, Helper.fahrenheitToKelvin(-459.67), accuracy: accuracy, message)
		XCTAssertEqual(temperature3.celsius, Helper.fahrenheitToCelsius(-459.67), accuracy: accuracy, message)
		XCTAssertEqual(temperature3.fahrenheit, -459.67, accuracy: accuracy, message)
	}
	
	// MARK: Test constants
	
	func testAbsoluteZero() {
		XCTAssertEqual(T.absoluteZero.kelvin, 0.0, accuracy: accuracy, message)
	}
	
	func testWaterFreezingPoint() {
		XCTAssertEqual(T.waterFreezingPoint.celsius, 0.0, accuracy: accuracy, message)
	}
	
	func testWaterBoilingPoint() {
		XCTAssertEqual(T.waterBoilingPoint.celsius, 100.0, accuracy: accuracy, message)
	}
	
	func testWaterTriplePoint() {
		XCTAssertEqual(T.waterTriplePoint.celsius, 0.01, accuracy: accuracy, message)
	}
	
	// MARK: Test `Comparable`
	
	func testComparison() {
		guard
			let temperature1 = T(kelvin: 42.0),
			let temperature2 = T(kelvin: 42.0),
			let temperature3 = T(kelvin: 1_000_000.0)
		else {
			XCTFail("Could not initialize temperature values. " + message)
			return
		}
		
		XCTAssertTrue(temperature1 == temperature2, message)
		XCTAssertTrue(temperature1 <= temperature2, message)
		XCTAssertTrue(temperature1 >= temperature2, message)
		
		XCTAssertFalse(temperature1 != temperature2, message)
		XCTAssertFalse(temperature1 <  temperature2, message)
		XCTAssertFalse(temperature1 >  temperature2, message)
		
		XCTAssertTrue(temperature1 != temperature3, message)
		XCTAssertTrue(temperature1 <= temperature3, message)
		XCTAssertTrue(temperature1 <  temperature3, message)
		XCTAssertTrue(temperature3 >= temperature1, message)
		XCTAssertTrue(temperature3 >  temperature1, message)
		
		XCTAssertFalse(temperature1 == temperature3, message)
		XCTAssertFalse(temperature1 >= temperature3, message)
		XCTAssertFalse(temperature1 >  temperature3, message)
		XCTAssertFalse(temperature3 <= temperature1, message)
		XCTAssertFalse(temperature3 <  temperature1, message)
	}
	
	// MARK: Test `Double` extensions
	
	func testDoubleConversionAsKelvin() {
		let value1: Double = 42.0
		let value2: Double = 0.0
		let value3: Double = -0.001
		
		guard
			let temperature1: T = value1.kelvin(),
			let temperature2: T = value2.kelvin()
		else {
			XCTFail("Could not initialize temperature values. " + message)
			return
		}
		
		XCTAssertEqual(temperature1.kelvin, value1, accuracy: accuracy, message)
		XCTAssertEqual(temperature2.kelvin, value2, accuracy: accuracy, message)
		
		let temperature3: T? = value3.kelvin()
		XCTAssertNil(temperature3, message)
	}
	
	func testDoubleConversionAsCelsius() {
		let value1: Double = 42.0
		let value2: Double = -273.15
		let value3: Double = -273.151
		
		guard
			let temperature1: T = value1.celsius(),
			let temperature2: T = value2.celsius()
		else {
			XCTFail("Could not initialize temperature values. " + message)
			return
		}
		
		XCTAssertEqual(temperature1.celsius, value1, accuracy: accuracy, message)
		XCTAssertEqual(temperature2.celsius, value2, accuracy: accuracy, message)
		
		let temperature3: T? = value3.celsius()
		XCTAssertNil(temperature3, message)
	}
	
	func testDoubleConversionAsFahrenheit() {
		let value1: Double = 42.0
		let value2: Double = -459.67
		let value3: Double = -459.671
		
		guard
			let temperature1: T = value1.fahrenheit(),
			let temperature2: T = value2.fahrenheit()
		else {
			XCTFail("Could not initialize temperature values. " + message)
			return
		}
		
		XCTAssertEqual(temperature1.fahrenheit, value1, accuracy: accuracy, message)
		XCTAssertEqual(temperature2.fahrenheit, value2, accuracy: accuracy, message)
		
		let temperature3: T? = value3.fahrenheit()
		XCTAssertNil(temperature3, message)
	}
}
