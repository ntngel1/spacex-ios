//
// Created by TK_user on 05.03.2020.
// Copyright (c) 2020 Kirill Shepelev. All rights reserved.
//

import Foundation

struct LaunchEntity: Decodable {
    let missionName: String
    let launchDateLocal: Date
    let flightNumber: Int
    let links: LaunchLinksEntity?
}
