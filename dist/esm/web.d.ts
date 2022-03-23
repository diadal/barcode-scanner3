import { WebPlugin } from '@capacitor/core';
import type { BarcodeScannerPlugin, CameraPreviewOptions, ScanResult } from './definitions';
export declare class BarcodeScannerWeb extends WebPlugin implements BarcodeScannerPlugin {
    startScan(_data: CameraPreviewOptions | null): Promise<ScanResult>;
}
