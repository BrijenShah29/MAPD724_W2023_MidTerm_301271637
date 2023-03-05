//
//  EndScenePotrait.swift
//  MAPD724_MidTerm_Brijen
//
//  Created by Brijen Shah on 2023-03-05.
//

import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

class EndScenePotrait: SKScene
{
    // instance variables
    var ocean1: OceanPotrait?
    var ocean2: OceanPotrait?
    
    override func sceneDidLoad()
    {
        name = "END"
        
        // add the first ocean to the Scene
        ocean1 = OceanPotrait()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add the second ocean to the scene
        ocean2 = OceanPotrait()
        ocean2?.position.y = -627
        addChild(ocean2!)
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean1?.Update()
        ocean2?.Update()
    }
}
