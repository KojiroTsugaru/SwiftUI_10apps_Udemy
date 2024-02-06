import UIKit

enum UserError: Error {
case InvalidID
case InvalidName
}

func userDetails(id: Int, name: String) throws {
    if  id == 0 {
        throw UserError.InvalidID
    }
    if  name == "" {
        throw UserError.InvalidName
    }
}

do {
    try userDetails(id: 1, name: "kojiro")
} catch  UserError.InvalidID {
    print("Invalid Id")
} catch UserError.InvalidName{
    print("Invalid Name")
}
