//
//  Dhamma.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import Foundation
import GRDB

struct Dhamma: Identifiable, Codable, TableRecord, Equatable, FetchableRecord,  MutablePersistableRecord  {
    
    static var databaseTableName: String = "tbl_dhamma"
    
    var id: Int64
    var message: String
    var mm_message: String
    var pali_message: String
    var pali_roman: String
    var fav: Int
    var category_id: Int
    
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let message = Column(CodingKeys.message)
        static let mm_message = Column(CodingKeys.mm_message)
        static let pali_message = Column(CodingKeys.pali_message)
        static let pali_roman = Column(CodingKeys.pali_roman)
        static let fav = Column(CodingKeys.fav)
        static let category_id = Column(CodingKeys.category_id)
    }
    
}
