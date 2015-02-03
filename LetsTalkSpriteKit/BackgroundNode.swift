//
//  BackgroundNode.swift
//  LetsTalkSpriteKit
//
//  Created by Peter Bødskov on 01/02/15.
//  Copyright (c) 2015 Peter Bødskov. All rights reserved.
//

import SpriteKit

class BackgroundNode: SKSpriteNode {

    let greenBar: SKSpriteNode = SKSpriteNode(color: UIColor.greenColor(), size: CGSizeZero)
    let blueBar: SKSpriteNode = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeZero)
    let yellowBar: SKSpriteNode = SKSpriteNode(color: UIColor.yellowColor(), size: CGSizeZero)
    let redBar: SKSpriteNode = SKSpriteNode(color: UIColor.redColor(), size: CGSizeZero)
    
    func createBouncingBarsInView(view: SKView) {
        
        let barSize = CGSize(width: view.frame.width, height: 20)
        greenBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 100.0)
        greenBar.size = barSize
        greenBar.zPosition = 10
        self.addChild(greenBar)
        
        blueBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 150.0)
        blueBar.size = barSize
        blueBar.zPosition = 11
        self.addChild(blueBar)
        
        
        yellowBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 200.0)
        yellowBar.size = barSize
        yellowBar.zPosition = 12
        self.addChild(yellowBar)
        
        redBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 250.0)
        redBar.size = barSize
        redBar.zPosition = 13

        self.addChild(redBar)
        
        self.bounceAndBlinkLikeAManiacInView(view)
    }
    
    func bounceAndBlinkLikeAManiacInView(view: SKView) {
        let barPath = CGPathCreateMutable()
        CGPathMoveToPoint(barPath, nil, CGRectGetMinX(view.frame), CGRectGetMinY(view.frame))
        CGPathAddLineToPoint(barPath, nil, CGRectGetMinX(view.frame), 100)
        CGPathCloseSubpath(barPath)
        let barPathAction = SKAction.followPath(barPath, duration: 2.0)
        let barHide = SKAction.fadeOutWithDuration(1.0)
        let barShow = SKAction.fadeInWithDuration(1.0)
        let greenBarSequence = SKAction.sequence([barHide, barShow])
        let barPathActionForever = SKAction.repeatActionForever(barPathAction)
        let greenBarHideShowForever = SKAction.repeatActionForever(greenBarSequence)
        greenBar.runAction(barPathActionForever)
        greenBar.runAction(greenBarHideShowForever)
        
        blueBar.runAction(barPathActionForever)
        let blueBarSequence = SKAction.sequence([SKAction.waitForDuration(1.0), barHide, barShow])
        let blueBarHideShowForever = SKAction.repeatActionForever(blueBarSequence)
        blueBar.runAction(blueBarHideShowForever)

        yellowBar.runAction(barPathActionForever)
        let yellowBarSequence = SKAction.sequence([SKAction.waitForDuration(1.5), barHide, barShow])
        let yellowBarHideShowForever = SKAction.repeatActionForever(yellowBarSequence)
        yellowBar.runAction(yellowBarHideShowForever)

        redBar.runAction(barPathActionForever)
        let redBarSequence = SKAction.sequence([SKAction.waitForDuration(2.0), barHide, barShow])
        let redBarHideShowForever = SKAction.repeatActionForever(redBarSequence)
        redBar.runAction(redBarHideShowForever)
    }
}
