//
//  IslandPotrait.swift
//  MAPD724_MidTerm_Brijen
//
//  Created by Brijen Shah on 2023-03-05.
//

import GameplayKit
import SpriteKit

class IslandPotrait : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.y <= -876)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.y = 876
        // get a pseudo random number
        let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.x = CGFloat(randomX)
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.y -= verticalSpeed!
    }
}
