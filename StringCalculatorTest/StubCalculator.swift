//
//  StubCalculator.swift
//  StringCalculatorTest
//
//  Created by 남기범 on 2021/10/30.
//

import Foundation
import TestHelper

class StubCalculator: StubContainer ,ArithmeticOperationProtocol, CalculatorProtocol {
    func calculate(with string: String) throws -> Int {
        self.verify(name: "calculateWithOperation", arg: string)
        return try self.resolveThrows(Int.self, name: "calculateWithString") ?? 0
    }
    
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return self.resolve(Int.self, name: "add") ?? 0
    }
    
    func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return self.resolve(Int.self, name: "substract") ?? 0
    }
    
    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return self.resolve(Int.self, name: "divide") ?? 0
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return self.resolve(Int.self, name: "multiply") ?? 0
    }
}
