//
//  TemperatureTests.swift
//  UnitlessTests
//
//  Created by Tomás Silveira Salles on 14.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import XCTest
@testable import Unitless

class TemperatureTests: XCTestCase {
	func testInitializers() {
		TemperatureImplementationTests<Temperature>().testInitializers()
	}
	
	func testConversionsFromKelvin() {
		TemperatureImplementationTests<Temperature>().testConversionsFromKelvin()
	}
	
	func testConversionsFromCelsius() {
		TemperatureImplementationTests<Temperature>().testConversionsFromCelsius()
	}
	
	func testConversionsFromFahrenheit() {
		TemperatureImplementationTests<Temperature>().testConversionsFromFahrenheit()
	}
	
	func testAbsoluteZero() {
		TemperatureImplementationTests<Temperature>().testAbsoluteZero()
	}
	
	func testWaterFreezingPoint() {
		TemperatureImplementationTests<Temperature>().testWaterFreezingPoint()
	}
	
	func testWaterBoilingPoint() {
		TemperatureImplementationTests<Temperature>().testWaterBoilingPoint()
	}
	
	func testWaterTriplePoint() {
		TemperatureImplementationTests<Temperature>().testWaterTriplePoint()
	}
	
	func testComparison() {
		TemperatureImplementationTests<Temperature>().testComparison()
	}
	
	func testHashing() {
		TemperatureImplementationTests<Temperature>().testHashing()
	}
	
	func testDoubleConversionAsKelvin() {
		TemperatureImplementationTests<Temperature>().testDoubleConversionAsKelvin()
	}
	
	func testDoubleConversionAsCelsius() {
		TemperatureImplementationTests<Temperature>().testDoubleConversionAsCelsius()
	}
	
	func testDoubleConversionAsFahrenheit() {
		TemperatureImplementationTests<Temperature>().testDoubleConversionAsFahrenheit()
	}
}
