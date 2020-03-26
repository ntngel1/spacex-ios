//
// Created by TK_user on 21.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

import Foundation

import RxSwift

protocol LaunchRepository: AnyObject {
    func getLaunches(for page: Int, with limit: Int) -> Observable<[LaunchEntity]>
}