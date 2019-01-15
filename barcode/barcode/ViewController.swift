import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var video = AVCaptureVideoPreviewLayer()
    var string = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try scanQRCode()
        }
        
        

    }
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if metadataObjects.count > 0 {
            let machineReadableCode = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if machineReadableCode.type == AVMetadataObject.ObjectType.qr{
                print(machineReadableCode.stringValue!)
            }
            
        }
        
    }
    
    func scanQRCode() {
        let avCaptureSession = AVCaptureSession()
        
        let avCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let avCaptureMetadataOutput = AVCaptureMetadataOutput()
        let avCaptureInput = try! AVCaptureDeviceInput(device: avCaptureDevice!)
        
        avCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        avCaptureSession.addInput(avCaptureInput)
        avCaptureSession.addOutput(avCaptureMetadataOutput)
        avCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        avCaptureSession.startRunning()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


//
//let session = AVCaptureSession()
//let captureDevice = AVCaptureDevice.default(for: .video)
//
//do {
//    let input = try! AVCaptureDeviceInput(device: captureDevice!)
//    session.addInput(input)
//}
//catch{
//    print("Error")
//}
//
//let output = AVCaptureMetadataOutput()
//session.addOutput(output)
//
//output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
//
//let video = AVCaptureVideoPreviewLayer(session: session)
//video.frame = view.layer.bounds
//view.layer.addSublayer(video)
//
////        self.view.bringSubview(toFront: ConfimationMessage)
////        self.view.bringSubview(toFront: Banner)
//
//
//session.startRunning()
