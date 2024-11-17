//
//  Task.swift
//  TaskManagerApp
//
//  Created by Ferhat Taşlı on 16.11.2024.
//

import Foundation


protocol Task {
    var title : String { get }
    var isCompleted : Bool { get set }
}
