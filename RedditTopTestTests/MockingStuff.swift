//
//  Something.swift
//  MockingTest
//
//  Created by Gleb on 5/1/16.
//  Copyright © 2016 LT. All rights reserved.
//

import Foundation
import XCTest

public func randomFloat(withing range: ClosedRange<Float>) -> Float {
    return (range.upperBound - range.lowerBound) * Float(Float(arc4random()) / Float(UInt32.max)) + range.lowerBound
}

public struct Expectation: Equatable, CustomStringConvertible {
	public typealias StringLiteralType = String

    let name: String
	
	init(_ name: String) {
		self.name = name
	}
	
    public var description: String {
        return self.name
    }
}

public func == (lhs: Expectation, rhs: Expectation) -> Bool {
    return lhs.name == rhs.name
}

protocol ResultExpectable: class {
	var expectedResult: Any? { get set }
}

public protocol Mockable: class {
	
    //Basic containers
    var expectations: [Expectation] { get set }
    var rejections: [Expectation] { get set }
    var resolvers: [Expectation] { get set }
	var stubs: [String : AnyObject] { get set }
	
    //Expect/Reject/Resolve
	
    func expect(expectation: Expectation)
    func reject(expectation: Expectation)
    func resolve(expectation: Expectation)
    func ignore(expectation: Expectation)
	func stub(method: String, expectedResult: AnyObject)
    
    //Verification
    func verifyAll()
}

public extension Mockable {
	
    func expect(expectation: Expectation) {
        self.expectations.append(expectation)
    }
    
    func reject(expectation: Expectation) {
        self.rejections.append(expectation)
    }
    
    func resolve(expectation: Expectation) {
        self.resolvers.append(expectation)
    }
    
    func ignore(expectation: Expectation) {
        if let index = self.resolvers.index(of: expectation) {
            self.resolvers.remove(at: index)
        }
    }
	
	func stub(method: String, expectedResult: AnyObject) {
		stubs.updateValue(expectedResult, forKey: method)
	}
	
    func verifyAll() {
		
        self.resolvers.forEach { (expectation) in
			
            //Check rejections first
            if self.rejections.contains(expectation) {
                XCTFail("Rejected expectation resolved: \(expectation)")
            }
			
            //Check expectations next
            if self.expectations.contains(expectation) {
                
                let index = self.expectations.index(of: expectation)
                self.expectations.remove(at: index!)
            } else {
                XCTFail("Unexpected expectation invoked: \(expectation)")
            }
        }
        
        self.expectations.forEach { (expectation) in
            
            //Check for expectation
            if self.resolvers.contains(expectation) {
                let index = self.resolvers.index(of: expectation)
                self.resolvers.remove(at: index!)
            } else {
                XCTFail("Unexpected expectation invoked: \(expectation)")
            }
            
            //Check for rejections
            if self.rejections.contains(expectation) {
                XCTFail("Rejected expectation resolved: \(expectation)")
            }
        }
    }
}
