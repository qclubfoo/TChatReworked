//
//  ChannelModel.swift
//  t-chatReworked
//
//  Created by Дмитрий on 17.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

protocol IChannelModel {
    var id: String { get }
    var name: String { get }
    var lastMessage: String? { get }
    var lastActivityDate: Date? { get }
    var lastActivityString: String { get }
}

struct ChannelModel: IChannelModel {
    var id: String
    var name: String
    var lastMessage: String?
    var lastActivityDate: Date?
    var lastActivityString: String {
        var lastActivity = ""
        if let date = lastActivityDate {
            let dateFormatter = DateFormatter()
            let calendar = Calendar.current
            if !calendar.isDateInToday(date) {
                dateFormatter.dateFormat = "dd MMM"
            } else {
                dateFormatter.dateFormat = "HH:mm"
            }
            lastActivity = dateFormatter.string(from: date)
        }
        return lastActivity
    }
}
