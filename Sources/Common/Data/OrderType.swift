// All rights reserved. Copyright © 2024 Adam Kramár.  

public enum OrderType: String, Codable {
    case name
    case released
    case added = "-added"
    case created
    case updated
    case rating = "-rating"
    case metacritic = "-metacritic"
}
