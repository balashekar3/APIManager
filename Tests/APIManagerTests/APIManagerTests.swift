import XCTest
@testable import APIManager

final class APIManagerTests: XCTestCase {
    
    var apiManager: APIManager!
    
    override func setUp() {
        apiManager = APIManager()
    }
    override func tearDown() {
        apiManager = nil
    }
    
    func test_APIManager_With_ValidData_ReturnsSuccess(){
        let expections = expectation(description: #function)
        
        apiManager.getData(from: MockAPIEndpoint.getProducts, with: [MockProductModel].self) { response in
            switch response{
            case .success(_):
                XCTAssertNotNil(response)
                expections.fulfill()
            case .failure(_):
                XCTFail()
            }
            
        }
        
        self.wait(for: [expections], timeout: 5)
    }
    func test_APIManager_With_NilDataRequst_RetunsFailure(){
        let expections = expectation(description: #function)
        
        apiManager.getData(from: MockAPIEndpoint.sendNilRequst, with: [MockProductModel].self) { response in
            switch response{
            case .success(_):
                XCTFail()
            case .failure(_):
                expections.fulfill()
            }
        }
        
        self.wait(for: [expections], timeout: 5)
    }
}
