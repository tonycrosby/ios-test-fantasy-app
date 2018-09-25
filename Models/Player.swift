import Foundation

struct Player {
    
    init() {
        firstName = ""
        lastName = ""
        imageURL = ""
        club = ClubEnum.adelaide
        height = 0
        weight = 0
        age = 0
        price = 0
        position = ""
        isFeatured = false
        imageData = nil
        lastPriceDate = ""
        clubData = nil
        careerGoals = 0
        bio = ""
        debut = ""
        id = 0
    }
    
    var id: Int
    var firstName: String
    var lastName: String
    var imageURL: String
    var club: ClubEnum
    var height: Int
    var weight: Int
    var age: Int
    var price: Int
    var lastPriceDate: String
    var position: String
    var isFeatured: Bool
    var imageData: Data?
    var clubData: Club?
    var careerGoals: Int
    var bio: String
    var debut: String
}
