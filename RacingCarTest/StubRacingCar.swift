//
//  StubRacingCarViewModel.swift
//  RacingCarTest
//
//  Created by 남기범 on 2021/11/05.
//

import Foundation
import TestHelper

class StubRacingCar: StubContainer, RacingCarProtocol {
    var position: Int = 0
    var forwardCondition: ClosedRange<Int>
    
    init(forwardCondition: ClosedRange<Int> = (4...9)) {
        self.forwardCondition = forwardCondition
    }
    
    func attemptForward(_ fuel: Int) {
        self.verify(name: "attemptForward", arg: fuel)
    }
}
