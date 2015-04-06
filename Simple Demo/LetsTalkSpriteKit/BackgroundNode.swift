//
//  BackgroundNode.swift
//  LetsTalkSpriteKit
//
//  Created by Peter Bødskov on 01/02/15.
//  Copyright (c) 2015 Peter Bødskov. All rights reserved.
//

import SpriteKit

class BackgroundNode: SKSpriteNode {
    
    let alphaValue: CGFloat = 0.6

    let greenBar: SKSpriteNode = SKSpriteNode(color: UIColor.greenColor(), size: CGSizeZero)
    let blueBar: SKSpriteNode = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeZero)
    let yellowBar: SKSpriteNode = SKSpriteNode(color: UIColor.yellowColor(), size: CGSizeZero)
    let redBar: SKSpriteNode = SKSpriteNode(color: UIColor.redColor(), size: CGSizeZero)
    
    func createBouncingBarsInView(view: SKView) {
        
        let barSize = CGSize(width: view.frame.width, height: 20)
        greenBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 50.0)
        greenBar.size = barSize
        greenBar.zPosition = 10
        greenBar.alpha = alphaValue
        self.addChild(greenBar)

        blueBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 100.0)
        blueBar.size = barSize
        blueBar.zPosition = 11
        blueBar.alpha = alphaValue
        self.addChild(blueBar)

        yellowBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 150.0)
        yellowBar.size = barSize
        yellowBar.zPosition = 12
        yellowBar.alpha = alphaValue
        self.addChild(yellowBar)
        
        redBar.position = CGPoint(x: CGRectGetMidX(view.frame), y: 200.0)
        redBar.size = barSize
        redBar.zPosition = 13
        redBar.alpha = alphaValue
        self.addChild(redBar)

        self.bounceAndBlinkLikeAManiacInView(view)
    }
    
    func bounceAndBlinkLikeAManiacInView(view: SKView) {
        let greenBarPath = createPathWithStartPoint(greenBar.position.y, inView: view)
        let greenBarBounce = createForeverBouncingActionWithPath(greenBarPath)
        greenBar.runAction(greenBarBounce)

        let blueBarPath = createPathWithStartPoint(blueBar.position.y, inView: view)
        let blueBarBounce = createForeverBouncingActionWithPath(blueBarPath)
        blueBar.runAction(blueBarBounce)

        let yellowBarPath = createPathWithStartPoint(yellowBar.position.y, inView: view)
        let yellowBarBounce = createForeverBouncingActionWithPath(yellowBarPath)
        yellowBar.runAction(yellowBarBounce)

        let redBarPath = createPathWithStartPoint(redBar.position.y, inView: view)
        let redBarBounce = createForeverBouncingActionWithPath(redBarPath)
        redBar.runAction(redBarBounce)
    }
    
    func createPathWithStartPoint(startPoint: CGFloat, inView view:SKView) -> CGPathRef {
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, CGRectGetMidX(view.frame), startPoint)
        CGPathAddLineToPoint(path, nil, CGRectGetMidX(view.frame), CGRectGetMinY(view.frame))
        CGPathAddLineToPoint(path, nil, CGRectGetMidX(view.frame), CGRectGetMaxY(view.frame))
        CGPathCloseSubpath(path)
        return path
    }
    
    func createForeverBouncingActionWithPath(path: CGPathRef) -> SKAction {
        let barPathAction = SKAction.followPath(path, asOffset: false, orientToPath: false, duration: 2.0)
        let barPathActionForever = SKAction.repeatActionForever(barPathAction)
        return barPathActionForever
    }
    
    func createShowHideForeverAction() -> SKAction {
        let barHide = SKAction.fadeAlphaTo(0.0, duration: 5.0)
        let barShow = SKAction.fadeAlphaTo(alphaValue, duration: 5.0)
        let barSequence = SKAction.sequence([barHide, barShow])
        let barHideShowForever = SKAction.repeatActionForever(barSequence)
        return barHideShowForever
    }
}
