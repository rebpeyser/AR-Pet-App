//
//  ViewController.swift
//  AR Pet App
//
//  Created by Rebecca Peyser on 6/14/19.
//  Copyright © 2019 Rebecca Peyser. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation)
        guard let node = hitTestResults.first?.node else { return }
        node.removeFromParentNode()
    }
    
    let config = ARWorldTrackingConfiguration()
    
    var petNode: SCNNode!
    let petNodeName = "shiba"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,   ARSCNDebugOptions.showWorldOrigin]
        sceneView.session.run(config)
        addPet()
    }
    
    func addPet() {
        let petScene = SCNScene(named: "Animals/ShibaInu.scn")!
        petNode = petScene.rootNode.childNode(withName: petNodeName, recursively: true)
        petNode.scale = SCNVector3(0.1, 0.1, 0.1)
        petNode.position = SCNVector3(0.1, 0.1, -0.1)
        sceneView.scene.rootNode.addChildNode(petNode)
    }

}

