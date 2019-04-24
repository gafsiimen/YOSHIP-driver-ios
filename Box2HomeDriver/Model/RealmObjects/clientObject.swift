//
//  clientObject.swift
//  Box2HomeDriver
//
//  Created by MacHD on 4/22/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import Foundation
import RealmSwift

final class clientObject: Object {
     @objc dynamic var firstname : String = ""
     @objc dynamic var lastname : String = ""
     @objc dynamic var phone : String = ""
     @objc dynamic var mail : String = ""
     @objc dynamic var avatarURL : String = ""
     @objc dynamic var societe : societeObject = societeObject()
}
