//
//  RacingGameViewModelTest.swift
//  RacingCar
//
//  Created by 남기범 on 2021/11/11.
//

import XCTest
import Combine
@testable import RacingCar

class RacingGameViewModelTest: XCTestCase {
    var viewModel: RacingGameViewModel!
    var storedSet: Set<AnyCancellable>!

    override func setUpWithError() throws {
        let car = RacingCar()
        viewModel = RacingGameViewModel(cars: [car])
        storedSet = Set<AnyCancellable>()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        storedSet = nil
    }
}

extension RacingGameViewModelTest {
    func test_car_position_output_after_racing() {
        let expect = expectation(description: "경기 후 차의 대수만큼 자동차의 위치를 String으로 표현")
        var carPositionsStringArray = [String]()
        let cars = [
            RacingCar(),
            RacingCar(),
            RacingCar(),
            RacingCar()
        ]
        
        viewModel = RacingGameViewModel(cars: cars)
        viewModel.carPositionPublisher
            .sink(receiveValue: { carPositions in
                expect.fulfill()
                carPositionsStringArray.append(contentsOf: carPositions)
            })
            .store(in: &storedSet)
        
        viewModel.startRacing()
        
        wait(for: [expect], timeout: 0.1)
        XCTAssertEqual(cars.count, carPositionsStringArray.count)
    }
    
    func test_compare_car_racing_repeat_count_event_count() {
        let expect = expectation(description: "경기를 반복하는 횟수만큼 자동차의 위치가 여러 번 표현됨")
        let repeatCount = 5
        expect.expectedFulfillmentCount = repeatCount
        
        viewModel.carPositionPublisher
            .sink(receiveValue: { _ in
                expect.fulfill()
            })
            .store(in: &storedSet)
        
        for _ in 0..<repeatCount {
            viewModel.startRacing()
        }
        
        wait(for: [expect], timeout: 0.1)
    }
}
