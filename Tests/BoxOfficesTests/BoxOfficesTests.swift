import XCTest
@testable import BoxOffices

final class BoxOfficesTests: XCTestCase {
    
    func test_fetch() async throws {
        
        struct Response: Decodable {
            let boxOfficeResult: BoxOfficeResult
        }
        
        struct BoxOfficeResult: Decodable {
            let dailyBoxOfficeList: [DailyBoxOffice]
        }
        
        struct DailyBoxOffice: Decodable {
            let movieCd: String
        }
        
        let apiClient = APIClient(key: "6a10305da351d7e867722f7521aeaacd")
        let response: Response = try await apiClient.fetch(
            path: "/boxoffice/searchDailyBoxOfficeList.json",
            httpMethod: .get,
            queryItems: [URLQueryItem(name: "targetDt", value: "20120101")]
        )
        
        XCTAssertEqual(response.boxOfficeResult.dailyBoxOfficeList.count, 10)
    }
    
    func test_fetchDailyTop10() async throws {
        let boxOffices = BoxOffices(key: "6a10305da351d7e867722f7521aeaacd")
        let result = await boxOffices.fetchDailyTop10()
        let topMovies = try result.get()
        
        XCTAssertEqual(topMovies.count, 10)
    }
    
}
