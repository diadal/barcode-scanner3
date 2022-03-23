export interface BarcodeScannerPlugin {
    startScan(data: CameraPreviewOptions | null): Promise<ScanResult>;
}
export interface ScanResult {
    hasContent: boolean;
    code?: string;
}
export declare type CameraPosition = 'rear' | 'front';
export interface CameraPreviewOptions {
    /** The preview width in pixels, default window.screen.width (applicable to the android and ios platforms only) */
    width?: number;
    /** The preview height in pixels, default window.screen.height (applicable to the android and ios platforms only) */
    height?: number;
    /** The x origin, default 0 (applicable to the android and ios platforms only) */
    x?: number;
    /** The y origin, default 0 (applicable to the android and ios platforms only) */
    y?: number;
    /** The preview bottom padding in pixes. Useful to keep the appropriate preview sizes when orientation changes (applicable to the android and ios platforms only) */
    paddingBottom?: number;
    /** Rotate preview when orientation changes (applicable to the ios platforms only; default value is true) */
    rotateWhenOrientationChanged?: boolean;
    /** Choose the camera to use 'front' or 'rear', default 'front' */
    position?: CameraPosition | string;
    /** Defaults to false - iOS only - Activate high resolution image capture so that output images are from the highest resolution possible on the device **/
    enableHighResolution?: boolean;
}
