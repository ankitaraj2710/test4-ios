//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
// add sprites
    var player:SKSpriteNode!
    let PLAYER_SPEED:CGFloat = 15
    var flag:SKSpriteNode!
    var winblock:SKSpriteNode!
    var isblock:SKSpriteNode!
    var wall:SKSpriteNode!
    var stopblock:SKSpriteNode!
    var wallblock:SKSpriteNode!
    var flagblock:SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.player = (self.childNode(withName: "player") as! SKSpriteNode)
        self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        self.player.physicsBody?.affectedByGravity = false
        self.player.physicsBody?.categoryBitMask = 1
        self.player.physicsBody?.collisionBitMask = 2
        self.player.physicsBody?.contactTestBitMask = 45
        
        // adding hitboxes
        self.stopblock = self.childNode(withName: "stopblock") as! SKSpriteNode
        self.stopblock.physicsBody =  SKPhysicsBody(rectangleOf: stopblock.size)
        self.stopblock.physicsBody?.affectedByGravity = false
        self.stopblock.physicsBody?.categoryBitMask = 2
        self.stopblock.physicsBody?.collisionBitMask = 1
        self.stopblock.physicsBody?.contactTestBitMask = 0
        
        
        
        self.flag = self.childNode(withName: "flag") as! SKSpriteNode
        self.flag.physicsBody =  SKPhysicsBody(rectangleOf: flag.size)
        self.flag.physicsBody?.affectedByGravity = false
        self.flag.physicsBody?.categoryBitMask = 4
        self.flag.physicsBody?.contactTestBitMask = 1
        self.flag.physicsBody?.collisionBitMask = 0
        //
        
        
        self.winblock = self.childNode(withName: "winblock") as! SKSpriteNode
//        self.winblock = (self.childNode(withName: "winblock") as! SKSpriteNode)
        self.winblock.physicsBody =  SKPhysicsBody(rectangleOf: winblock.size)
        self.winblock.physicsBody?.affectedByGravity = false
        self.winblock.physicsBody?.categoryBitMask = 6
        self.winblock.physicsBody?.contactTestBitMask = 1
        self.winblock.physicsBody?.collisionBitMask = 1
        
        self.isblock = self.childNode(withName: "isblock") as! SKSpriteNode
        self.isblock.physicsBody =  SKPhysicsBody(rectangleOf: isblock.size)
        self.isblock.physicsBody?.affectedByGravity = false
        self.isblock.physicsBody?.categoryBitMask = 8
        self.isblock.physicsBody?.collisionBitMask = 0
        self.isblock.physicsBody?.contactTestBitMask = 0
        
        
        
        self.wallblock = self.childNode(withName: "wallblock") as! SKSpriteNode
        self.wallblock.physicsBody =  SKPhysicsBody(rectangleOf: wallblock.size)
        self.wallblock.physicsBody?.affectedByGravity = false
        self.wallblock.physicsBody?.categoryBitMask = 16
        self.wallblock.physicsBody?.contactTestBitMask = 1
        self.wallblock.physicsBody?.collisionBitMask = 3
        
        
        self.flagblock = self.childNode(withName: "flagblock") as! SKSpriteNode
        self.flagblock.physicsBody =  SKPhysicsBody(rectangleOf: flagblock.size)
        self.flagblock.physicsBody?.affectedByGravity = false
        self.flagblock.physicsBody?.categoryBitMask = 32
        self.flagblock.physicsBody?.contactTestBitMask = 1
        self.flagblock.physicsBody?.collisionBitMask = 1
        
        
        self.wall = self.childNode(withName: "wall") as! SKSpriteNode
        self.wall.physicsBody =  SKPhysicsBody(rectangleOf: wall.size)
        self.wall.physicsBody?.affectedByGravity = false
        self.wall.physicsBody?.categoryBitMask = 64
        self.wall.physicsBody?.collisionBitMask = 0
        self.wall.physicsBody?.contactTestBitMask = 0
        
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // GET THE POSITION WHERE THE MOUSE WAS CLICKED
        // ---------------------------------------------
        let mouseTouch = touches.first
        if (mouseTouch == nil) {
            return
        }
        let location = mouseTouch!.location(in: self)

        // WHAT NODE DID THE PLAYER TOUCH
        // ----------------------------------------------
        let nodeTouched = atPoint(location).name
        //print("Player touched: \(nodeTouched)")
        
        
        // GAME LOGIC: Move player based on touch
        if (nodeTouched == "upButton") {
            // move up
            self.player.position.y = self.player.position.y + PLAYER_SPEED
        }
        else if (nodeTouched == "downButton") {
            // move down
             self.player.position.y = self.player.position.y - PLAYER_SPEED
        }
        else if (nodeTouched == "leftButton") {
            // move left
             self.player.position.x = self.player.position.x - PLAYER_SPEED
        }
        else if (nodeTouched == "rightButton") {
            // move right
             self.player.position.x = self.player.position.x + PLAYER_SPEED
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
