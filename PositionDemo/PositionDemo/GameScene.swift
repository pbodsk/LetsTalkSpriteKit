//
//  GameScene.swift
//  PositionDemo
//
//  Created by Peter Bødskov on 10/04/15.
//  Copyright (c) 2015 Peter Bødskov. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        //println("Scene.size: \(self.size)")
        
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.xScale = 0.5
        sprite.yScale = 0.5
        sprite.position = CGPointZero
        self.addChild(sprite)
    }
       
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
