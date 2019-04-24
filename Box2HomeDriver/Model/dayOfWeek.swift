////
////  dayOfWeek.swift
////  Box2HomeDriver
////
////  Created by MacHD on 3/12/19.
////  Copyright © 2019 MacHD. All rights reserved.
////
//
//import Foundation
//class DayOfWeek: Decodable {
//    let code, label: String
//    init(code: String, label: String) {
//        self.code = code
//        self.label = label
//    }
//    enum CodingKeys: String, CodingKey {
//        case code, label
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        code = try container.decode(String.self, forKey: .code)
//        label = try container.decode(String.self, forKey: .label)
//    }
//}
////struct dayOfWeek : Codable {
////    let label : String
////    let code : String
////
////    init(label : String, code : String) {
////        self.label = label
////        self.code = code
////    }
////
////}

import Foundation

class DayOfWeek: Codable {
    let label: String?
    let code: String?
    
    init(label: String?, code: String?) {
        self.label = label
        self.code = code
    }
}

extension DayOfWeek {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(DayOfWeek.self, from: data)
        self.init(label: me.label, code: me.code)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        label: String?? = nil,
        code: String?? = nil
        ) -> DayOfWeek {
        return DayOfWeek(
            label: label ?? self.label,
            code: code ?? self.code
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

fileprivate func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

fileprivate func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
