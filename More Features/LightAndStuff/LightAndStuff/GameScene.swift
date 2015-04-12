//
//  GameScene.swift
//  LightAndStuff
//
//  Created by Peter Bødskov on 06/04/15.
//  Copyright (c) 2015 Peter Bødskov. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var light = SKLightNode()
    let lightButton = SKLabelNode(text: "With the lights out")
    let lightMovementButton = SKLabelNode(text: "Here we are now, entertain us")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        backgroundColor = NSColor.darkGrayColor()
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        let CGRectFrame = NSRectToCGRect(view.frame)
        sprite.position = CGPoint(x:CGRectGetMidX(CGRectFrame), y:CGRectGetMidY(CGRectFrame))
        sprite.setScale(0.5)
        
        //HEADS UP!!! You'll need these two!!
        sprite.lightingBitMask = 1
        sprite.shadowCastBitMask = 1
        
        self.addChild(sprite)
        
        light.name = "light"
        light.position = CGPoint(x: CGRectGetMidX(CGRectFrame), y: CGRectGetMaxY(CGRectFrame) - 50)
        light.categoryBitMask = 1
        //light.falloff = 10.5
        light.zPosition = 1
        light.ambientColor = NSColor.blueColor()
        light.lightColor = NSColor.redColor()
        light.shadowColor = NSColor(calibratedRed: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        light.enabled = false
        
        self.addChild(light)
        
        lightButton.position = CGPoint(x: CGRectGetMidX(CGRectFrame), y: CGRectGetMaxY(CGRectFrame) - 50)
        lightButton.fontName = "Impact"
        self.addChild(lightButton)
        
        lightMovementButton.position = CGPoint(x: CGRectGetMidX(CGRectFrame), y: CGRectGetMaxY(CGRectFrame) - 150)
        lightMovementButton.fontName = "Impact"
        self.addChild(lightMovementButton)

    }
    
    func toggleLight() {
        light.enabled = !light.enabled
    }
    
    func moveLight() {
        let moveAction = SKAction.moveBy(CGVector(dx: 0, dy: -500), duration: 2)
        let moveBackAction = moveAction.reversedAction()
        let moveForever = SKAction.repeatActionForever(SKAction.sequence([moveAction, moveBackAction]))
        light.runAction(moveForever)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        let location = theEvent.locationInNode(self)
        if nodeAtPoint(location) == lightButton {
            toggleLight()
        }
        
        if nodeAtPoint(location) == lightMovementButton {
            moveLight()
        }

    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
