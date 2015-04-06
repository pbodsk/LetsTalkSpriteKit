//
//  EmitterNode.swift
//  LetsTalkSpriteKit
//
//  Created by Peter Bødskov on 03/02/15.
//  Copyright (c) 2015 Peter Bødskov. All rights reserved.
//

import SpriteKit

class EmitterNode: SKNode {
    
    func createStarfieldInView(view: SKView) {
        let starFieldPath = NSBundle.mainBundle().pathForResource("starField", ofType: "sks")
        let starfield = NSKeyedUnarchiver.unarchiveObjectWithFile(starFieldPath!) as SKEmitterNode
        starfield.position = CGPointMake(CGRectGetMinX(view.frame), CGRectGetMidY(view.frame))
        self.zPosition = 0
        self.addChild(starfield)
    }
}
