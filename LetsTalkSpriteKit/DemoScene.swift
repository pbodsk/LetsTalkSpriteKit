//
//  DemoScene.swift
//  LetsTalkSpriteKit
//
//  Created by Peter Bødskov on 31/01/15.
//  Copyright (c) 2015 Peter Bødskov. All rights reserved.
//
//  Demo scene :-)

import SpriteKit

class DemoScene: SKScene {
    var centerTextNode: SKLabelNode
    
    //Used for calculating the distance we must move on each update tick
    var lastUpdateTimeInterval = CFTimeInterval(0)
    var distanceToMove: CGFloat = 250

    
    required init?(coder aDecoder: NSCoder) {
        centerTextNode = SKLabelNode(fontNamed: "AmericanTypewriter-CondensedBold")
        super.init(coder: aDecoder)
    }

    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.blackColor()
        addCenterTextToView(view)
        addBackgroundBarsToView(view)
        
    }
    
    //MARK: - Game loop
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        var timeSinceLast = currentTime - self.lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        if(timeSinceLast > 1){
            timeSinceLast = 1.0 / 60.0
        }
        
        var scrollDistance = CGFloat(timeSinceLast) * distanceToMove
        scrollCenterTextHorisontally(scrollDistance)

    }

    //MARK: - Adding of the different elements of our demo
    
    //MARK: - Center text
    func addCenterTextToView(view: SKView) {
        centerTextNode.text = "Pretty boring!"
        centerTextNode.position = CGPoint(x: CGRectGetMidX(view.frame), y: CGRectGetMidY(view.frame))
        centerTextNode.zPosition = 20
        self.addChild(centerTextNode)
        
        bounceCenterText()
    }
    
    func bounceCenterText() {
        centerTextNode.text = "Whoa! Getting seasick here"
        let centerPosition = CGRectGetMidY(self.frame)
        let top = centerPosition + 100
        let bottom = centerPosition - 100
        
        let goingUp = SKAction.moveToY(top, duration: 0.5)
        let centering = SKAction.moveToY(centerPosition, duration: 0.5)
        let goingDown = SKAction.moveToY(bottom, duration: 0.5)
        let bounce = SKAction.sequence([goingUp, centering, goingDown, centering])
        let bounceForever = SKAction.repeatActionForever(bounce)
        centerTextNode.runAction(bounceForever)
    }
    
    
    //MARK: - Updating text position from update method
    func scrollCenterTextHorisontally(scrollDistance: CGFloat) {
        //centerTextNode.text = "Yay! We're moving!"
        centerTextNode.position.x -= scrollDistance
        if centerTextNode.position.x < CGRectGetMinX(self.frame) - centerTextNode.frame.size.width / 2 {
            centerTextNode.position.x = CGRectGetMaxX(self.frame) + centerTextNode.frame.size.width / 2
        }
    }
    
    //MARK: - Background Bars
    func addBackgroundBarsToView(view: SKView) {
        let backgroundNode = BackgroundNode()
        backgroundNode.createBouncingBarsInView(view)
        self.addChild(backgroundNode)
    }
    
    /* Not used in this demo
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
    */
   
}
