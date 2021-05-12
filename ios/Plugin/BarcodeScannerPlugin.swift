import Foundation
import UIKit
import Capacitor
import AVFoundation


protocol BarcodeScannerPDelegate: class {
    func qrScanningDidFail(error :String)
    func qrScanningSucceededWithCode(_ str: String?)
    func qrScanningDidStop()
}

class BarcodeScannerP: UIView {

    weak var delegate: BarcodeScannerPDelegate?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var captureSession: AVCaptureSession?
    var metadataObjectTypes: [AVMetadataObject.ObjectType]!


    override func layoutSubviews() {
        super.layoutSubviews();
        if let sublayers = self.layer.sublayers {
            for layer in sublayers {
                layer.frame = self.bounds;
            }
        }

    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("We aren't using storyboards")
//    }
//        required init?(coder aDecoder: NSCoder) {
//                super.init(coder: aDecoder)
//                doInitialSetup()
//            }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        //            doInitialSetup()
//    }
//    let availableMetadataObjectTypes: [AVMetadataObject.ObjectType]

    override class var layerClass: AnyClass  {
        return AVCaptureVideoPreviewLayer.self
    }
    override var layer: AVCaptureVideoPreviewLayer {
        return super.layer as! AVCaptureVideoPreviewLayer
    }


}
extension BarcodeScannerP {

    var isRunning: Bool {
        return captureSession?.isRunning ?? false
    }

    func startScan() {
        self.isRunning ? self.stopScanning() : self.startScanning()
    }
   
    func CheckStatus() {
        clipsToBounds = true
        self.layer.session = captureSession
        self.layer.videoGravity = .resizeAspectFill
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:  // The user has previously granted access to the camera.
                self.doInitialSetup()

        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.doInitialSetup()
                }
            }

        case .denied: // The user has previously denied access.
            scanningDidFail()
            return

        case .restricted: // The user can't grant access due to restrictions.
            scanningDidFail()
            return
        @unknown default:
            scanningDidFail()
        }
    }


    func startScanning() {
        CheckStatus()
    }

    func stopScanning() {
        captureSession?.stopRunning()
        delegate?.qrScanningDidStop()
    }

    private func doInitialSetup() {
        
        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch let error {
            delegate?.qrScanningDidFail(error:error.localizedDescription)
            return
        }

        if (captureSession?.canAddInput(videoInput) ?? false) {
            captureSession?.addInput(videoInput)
        } else {
            scanningDidFail()
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession?.canAddOutput(metadataOutput) ?? false) {
            captureSession?.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
             metadataOutput.metadataObjectTypes = [.qr, .ean8, .ean13, .pdf417]
        } else {
            scanningDidFail()
            return
        }

        
        captureSession?.startRunning()


    }
    func scanningDidFail() {
        delegate?.qrScanningDidFail(error: "fail to scan")
        captureSession = nil
    }

    func found(code: String) {
        delegate?.qrScanningSucceededWithCode(code)
    }

}

extension BarcodeScannerP: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        stopScanning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
    }

}

@objc(BarcodeScannerPlugin)
class BarcodeScannerPlugin:CAPPlugin, BarcodeScannerPDelegate {
    func qrScanningDidFail(error:String) {

        call?.reject(error)
        showBackground()
    }

    func qrScanningSucceededWithCode(_ str: String?) {
        let co = [
            "code": str
        ]
        call?.resolve(co as PluginCallResultData)
        showBackground()
    }

    func qrScanningDidStop() {
        showBackground()

    }

    let scannerView = BarcodeScannerP()
    var call: CAPPluginCall?

    @objc func startScan(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            self.hideBackground()
            self.call = call
            self.scannerView.delegate = self
            self.scannerView.startScan()
        }
    }

    private func hideBackground() {
        DispatchQueue.main.async {
            self.bridge?.webView?.isOpaque = false
            self.bridge?.webView?.scrollView.backgroundColor = UIColor.clear
            let javascript = "document.documentElement.style.backgroundColor = 'transparent'"
            let javascript2 = " document.body.classList.add('qrscanner')"

            self.bridge?.webView?.evaluateJavaScript(javascript)
            self.bridge?.webView?.evaluateJavaScript(javascript2)
        }
    }

    private func showBackground() {
        DispatchQueue.main.async {
            let javascript = "document.documentElement.style.backgroundColor = ''"
            let javascript2 = "document.body.classList.remove('qrscanner')"
            self.bridge?.webView?.evaluateJavaScript(javascript2)

            self.bridge?.webView?.evaluateJavaScript(javascript) { (result, error) in
                self.bridge?.webView?.isOpaque = true
                self.bridge?.webView?.backgroundColor = UIColor.white
                self.bridge?.webView?.scrollView.backgroundColor = UIColor.white
            }
        }
    }


}

