//
//  OceanPotrait.swift
//  MAPD724_MidTerm_Brijen
//
//  Created by Brijen Shah on 2023-03-05.
//

import GameplayKit
import SpriteKit

class OceanPotrait : GameObject
{
    // constructor / initializer
    init()
    {
        super.init(imageString: "oceanpotrait", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.y <= -2253)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.y = 2253
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
    }
}

