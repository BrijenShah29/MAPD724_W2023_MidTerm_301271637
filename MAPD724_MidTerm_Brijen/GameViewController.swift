//
//  GameViewController.swift
//  MAPD724_MidTerm_Brijen
//
//  Created by Brijen Shah on 2023-03-04.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // Instance Variables
    var currentScene: GKScene?
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndLabel: UILabel!
    @IBOutlet weak var RestartButton: UIButton!
    
    var gamePlay = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        presentStartScene()
        
        CollisionManager.gameViewController = self
    }
    
   override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if(UIDevice.current.orientation.isLandscape) {
            if(gamePlay){
                // landscape mode
                setScene(sceneName: "GameScene")
            }
      
        } else if(UIDevice.current.orientation.isPortrait) {
            if(gamePlay){
                setScene(sceneName: "GameScenePotrait")
            }
            
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .all

        } else {
            return .all
        }
    }
    
  override var shouldAutorotate: Bool {
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    func presentStartScene()
    {
    if(UIDevice.current.orientation.isLandscape) {
        setScene(sceneName: "StartScene")
    } else {
        setScene(sceneName: "StartScenePotrait")
    }
       gamePlay = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = false
        StartButton.isHidden = false
          

    }
    
    func presentEndScene()
    {
        if(UIDevice.current.orientation.isLandscape) {
            setScene(sceneName: "EndScene")
        }else
        {
            setScene(sceneName: "EndScenePotrait")
        }
        gamePlay = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        RestartButton.isHidden = false
        EndLabel.isHidden = false
       
    }
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        if(UIDevice.current.orientation.isLandscape) {
            setScene(sceneName: "GameScene")
        } else
        {
            setScene(sceneName: "GameScenePotrait")
        }
        gamePlay = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        StartLabel.isHidden = true
        StartButton.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
    }
    
    @IBAction func RestartButton_Pressed(_ sender: UIButton)
    {
        if(UIDevice.current.orientation.isLandscape) {
            setScene(sceneName: "GameScene")
        } else
        {
            setScene(sceneName: "GameScenePotrait")
        }
        gamePlay = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        RestartButton.isHidden = true
        EndLabel.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
    
    }
    
}
