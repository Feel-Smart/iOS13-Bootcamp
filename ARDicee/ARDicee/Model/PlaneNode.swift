//
//  PlaneNode.swift
//  ARDicee
//
//  Created by Matthew Musgrove on 4/10/20.
//  Copyright © 2020 Matthew Musgrove. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

class PlaneNode: SCNNode {
    
    init(_ plane: SCNPlane, _ position: SCNVector3){
        super.init()
    
        self.position = position

        self.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)

        let gridMaterial = SCNMaterial()

        gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")

        plane.materials = [gridMaterial]

        self.geometry = plane
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
