import Foundation
import Capacitor
import AVFoundation

@objc(BarcodeScannerPlugin)
class BarcodeScannerPlugin:CAPPlugin, CameraControllerDelegate {
    func qrScanningDidFail(error:String) {
        showBackground()
        call?.reject(error)

    }

    func qrScanningSucceededWithCode(_ str: String?) {
        showBackground()
        let co = [
            "code": str
        ]
        call?.resolve(co as PluginCallResultData)
    }

    func qrScanningDidStop() {
        showBackground()
    }

    var previewView:UIView!
    var cameraPosition = String()
    let cameraController = CameraController()
    var x: CGFloat?
    var y: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var paddingBottom: CGFloat?
    var rotateWhenOrientationChanged: Bool?
    var toBack: Bool?
    var storeToFile: Bool?
    var highResolutionOutput: Bool = false
    var call: CAPPluginCall?

    @objc func rotated() {

        let height = self.paddingBottom != nil ? self.height! - self.paddingBottom!: self.height!;

        if UIDevice.current.orientation.isLandscape {
            self.previewView.frame = CGRect(x: self.y!, y: self.x!, width: height, height: self.width!)
            self.cameraController.previewLayer?.frame = self.previewView.frame
        }

        if UIDevice.current.orientation.isPortrait {
            if (self.previewView != nil && self.x != nil && self.y != nil && self.width != nil && self.height != nil) {
                self.previewView.frame = CGRect(x: self.x!, y: self.y!, width: self.width!, height: self.height!)
            }
            self.cameraController.previewLayer?.frame = self.previewView.frame
        }

        cameraController.updateVideoOrientation()
    }


    @objc func startScan(_ call: CAPPluginCall) {
        self.cameraPosition = "rear"
        self.highResolutionOutput = false
        self.cameraController.highResolutionOutput = self.highResolutionOutput;
        let yx = call.getInt("y")
        let sh = UIScreen.main.bounds.size.height
        let ms = UIScreen.main.scale
        let pd = call.getInt("paddingBottom")
        let xx = call.getInt("x")
        if call.getInt("width") != nil {
            self.width = CGFloat(call.getInt("width")!)
        } else {
            self.width = UIScreen.main.bounds.size.width
        }
        if call.getInt("height") != nil {
            self.height = CGFloat(call.getInt("height")!)
        } else {
            self.height = (sh - (ms > 2 ? (CGFloat(pd!) + CGFloat(yx!)) : CGFloat(yx!) ))
        }

        self.x = xx != nil ? CGFloat(xx!)/ms: 0
        self.y = (yx != nil) ? (ms > 2 ? CGFloat(yx!)/ms : 34) : 0
        if pd != nil {
            self.paddingBottom = CGFloat(pd!)
        }

        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
            if (!granted) {
                call.reject("permission failed");
            }
        });

        self.rotateWhenOrientationChanged = call.getBool("rotateWhenOrientationChanged") ?? true
        self.toBack = call.getBool("toBack") ?? false
        self.storeToFile = call.getBool("storeToFile") ?? false

        if (self.rotateWhenOrientationChanged == true) {
            NotificationCenter.default.addObserver(self, selector: #selector(BarcodeScannerPlugin.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        }

        DispatchQueue.main.async {
            if (self.cameraController.captureSession?.isRunning ?? false) {
                call.reject("camera already started")
            } else {

                self.cameraController.prepare(cameraPosition: self.cameraPosition){error in
                    if let error = error {
                        print(error)
                        call.reject(error.localizedDescription)
                        return
                    }
                    self.previewView = UIView(frame: CGRect(x: self.x!, y: self.y!, width: self.width!, height: self.height!))
                    self.webView?.isOpaque = false
                    self.webView?.backgroundColor = UIColor.clear
                    self.webView?.scrollView.backgroundColor = UIColor.clear
                    self.webView?.superview?.addSubview(self.previewView)
                    if (self.toBack!) {
                        self.webView?.superview?.bringSubviewToFront(self.webView!)
                    }
                    try? self.cameraController.displayPreview(on: self.previewView)
                    self.call = call
                    self.cameraController.delegate = self

                }
            }
        }

    }

    private func showBackground() {
        DispatchQueue.main.async {
            let javascript = "document.documentElement.style.backgroundColor = ''"
            let javascript2 = "document.body.classList.remove('qrscanner')"
            self.bridge?.webView?.evaluateJavaScript(javascript2)
            self.bridge?.webView?.evaluateJavaScript(javascript) { (result, error) in
                self.previewView.removeFromSuperview()
                self.webView?.isOpaque = true
                self.call?.resolve()
            }
        }
    }




}



