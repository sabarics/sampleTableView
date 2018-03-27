//
//  TableModel.swift
//  SampleTableView
//
//  Created by Kamaraj on 26/03/18.
//  Copyright © 2018 sabari. All rights reserved.
//
import Foundation

class Level: NSObject
{
    var levelName : String!
    var isSelected: Bool = false
}

class TestOption: NSObject
{
    var totalScore : String!
    var detailScore: String!
}

class Distrctor : NSObject
{
    var distractorName : String!
    var isSelected: Bool = false
}

class Selection : NSObject
{
    var selectionName : String!
    var isSelected: Bool = false
}
