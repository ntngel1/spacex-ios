//
// Created by TK_user on 21.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

import RxSwift
import Alamofire

extension Observable where Element == DataRequest {

    func decodeJson<T : Decodable>(_ responseType: T.Type) -> Observable<T> {
        self.validate(contentType: ["application/json"])
                .responseData()
                .map({
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    decoder.dateDecodingStrategy = .iso8601
                    return try decoder.decode(responseType, from: $1)
                })
    }
}

extension Observable {

    func `do`(finally: @escaping () -> Void) -> Observable {
        `do`(afterError: { _ in
            finally()
        }, afterCompleted: {
            finally()
        }, onDispose: {
            finally()
        })
    }
}