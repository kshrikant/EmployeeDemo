//
//  EmployeeDemoTests.swift
//  EmployeeDemoTests
//
//  Created by Kanakatti Shrikant on 10/11/22.
//

import XCTest
@testable import EmployeeDemo

class EmployeeDemoTests: XCTestCase {

    var urlSession: URLSession!

    override func setUpWithError() throws {
        urlSession = URLSession(configuration: .default)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        urlSession = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testListApiCall() {
        //We can pass URL here accordingly to test API reponse
      let urlString = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people"
      let url = URL(string: urlString)!
      let promise = expectation(description: "Status code: 200")
      let dataTask = urlSession.dataTask(with: url) { _, response, error in
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
