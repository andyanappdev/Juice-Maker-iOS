//
//  StoryboardIdentifiable.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/14/23.
//

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
