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
        let barActionDown = SKAction.moveToY(CGRectGetMinY(view.frame), duration: 1.5)
        let barActionUp = SKAction.moveToY(CGRectGetMaxY(view.frame), duration: 1.5)

        /*
        let barDelay = SKAction.waitForDuration(1.0)
        */
        let barActionSequece = SKAction.sequence([barActionDown, barActionUp])
        
        let barActionForever = SKAction.repeatActionForever(barActionSequece)
        /*
        let barActionBlueSequence = SKAction.sequence([barDelay, barActionGreenSequece])
        let barActionBlueForever = SKAction.repeatActionForever(barActionBlueSequence)
*/
        greenBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 100.0)
        greenBar.size = barSize
        greenBar.zPosition = 10
        greenBar.runAction(barActionForever)
        self.addChild(greenBar)
        
        blueBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 150.0)
        blueBar.size = barSize
        blueBar.zPosition = 11
//        blueBar.runAction(SKAction.waitForDuration(1.0))
        blueBar.runAction(barActionForever)
        self.addChild(blueBar)
        
        yellowBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 200.0)
        yellowBar.size = barSize
        yellowBar.zPosition = 12
//        yellowBar.runAction(barActionForever)
        self.addChild(yellowBar)
        
        redBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 250.0)
        redBar.size = barSize
        redBar.zPosition = 13
  //      redBar.runAction(barActionForever)
        self.addChild(redBar)
        
       // self.runAction(barActionGreenForever)
    }
}
