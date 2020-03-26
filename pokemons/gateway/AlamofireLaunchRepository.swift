//
//  AlamofireLaunchRepository.swift
//  pokemons
//
//  Created by TK_user on 03.03.2020.
//  Copyright © 2020 Kirill Shepelev. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

class AlamofireLaunchRepository: LaunchRepository {

    func getLaunches(for page: Int, with limit: Int) -> Observable<[LaunchEntity]> {
        request(.get,
                "\(ApiConstants.BASE_URL)/v3/launches",
                parameters: [
                    "limit": limit,
                    "offset": page * limit
                ]
        ).decodeJson([LaunchEntity].self)
    }
}
