import Foundation

public class APIManager:APIManagerProtocol{
    
    public init(){}
    
    public func getData<D>(from endpoint: EndpointProtocol, with responseModel: D.Type, completion: @escaping Handler<D>) where D : Decodable {
        do {
            let request = try createRequest(from: endpoint)
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data, error == nil else {
                    completion(.failure(.noData))
                    return
                }
                guard let response = response as? HTTPURLResponse,
                      200 ... 299 ~= response.statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let resultData = try JSONDecoder().decode(responseModel, from: data)
                    completion(.success(resultData))
                }catch {
                    completion(.failure(.decodeError))
                }
            }.resume()
        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
    
    public func createRequest(from endpoint: EndpointProtocol) throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters
        }
        guard let url = urlComponents.url else {
            throw RequestError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONEncoder().encode(body)
        }
        return request
    }
}
