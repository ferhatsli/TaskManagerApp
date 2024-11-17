//
//  Task+Extensions.swift
//  TaskManagerApp
//
//  Created by Ferhat Taşlı on 17.11.2024.
//

import Foundation


extension Task {
    mutating func markAsCompleted() {
        self.isCompleted = true
        print("\(self.title) is completed.")
    }
}
