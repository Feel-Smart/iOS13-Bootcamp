//
//  ViewController.swift
//  Poke3D
//
//  Created by Matthew Musgrove on 4/11/20.
//  Copyright © 2020 Matthew Musgrove. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Pokemon Cards", bundle: Bundle.main){
        
            configuration.trackingImages = imageToTrack
            
            configuration.maximumNumberOfTrackedImages = 2
            
            print("Images Successfully Added")
            
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let pokemonTracked = imageAnchor.referenceImage.name!
            
            let plane = SCNPlane(
                width: imageAnchor.referenceImage.physicalSize.width,
                height: imageAnchor.referenceImage.physicalSize.height
            )
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = (-.pi/2)
            
            node.addChildNode(planeNode)
            
            if pokemonTracked == "charmander-card" {
            
                displayPokemon(node: planeNode, pokemon: "art.scnassets/Charmander.scn")
                
            } else if pokemonTracked == "rhydon-card" {
                
                displayPokemon(node: planeNode, pokemon: "art.scnassets/RhydonM.scn")
                
            }
                
                
            
        }
        
        return node
    }
    
    fileprivate func displayPokemon(node planeNode: SCNNode, pokemon pokemonAsset: String) {
        if let pokeScene = SCNScene(named: pokemonAsset){
            
            if let pokeNode = pokeScene.rootNode.childNodes.first {
                
                pokeNode.eulerAngles.x = (.pi/2)
                planeNode.addChildNode(pokeNode)
                
            }
            
        }
    }

}
