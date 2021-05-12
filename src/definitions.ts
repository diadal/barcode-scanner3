export interface BarcodeScannerPlugin {
  // echo(options: { value: string }): Promise<{ value: string }>;
  // prepare(): Promise<void>;
  // hideBackground(): Promise<void>;
  // showBackground(): Promise<void>;
  startScan(data: CameraPreviewOptions | null): Promise<ScanResult>;
  // stopScan(): Promise<void>;
  // checkPermission(
  //   options: CheckPermissionOptions,
  // ): Promise<CheckPermissionResult>;
  // openAppSettings(): Promise<void>;
}

// export enum SupportedFormat {
//   // 1D Product
//   UPC_A = 'UPC_A', // Android only, UPC_A is part of EAN_13 according to Apple docs
//   UPC_E = 'UPC_E',
//   UPC_EAN_EXTENSION = 'UPC_EAN_EXTENSION', // Android only
//   EAN_8 = 'EAN_8',
//   EAN_13 = 'EAN_13',
//   // 1D Industrial
//   CODE_39 = 'CODE_39',
//   CODE_39_MOD_43 = 'CODE_39_MOD_43', // iOS only
//   CODE_93 = 'CODE_93',
//   CODE_128 = 'CODE_128',
//   CODABAR = 'CODABAR', // Android only
//   ITF = 'ITF',
//   ITF_14 = 'ITF_14', // iOS only
//   // 2D
//   AZTEC = 'AZTEC',
//   DATA_MATRIX = 'DATA_MATRIX',
//   MAXICODE = 'MAXICODE', // Android only
//   PDF_417 = 'PDF_417',
//   QR_CODE = 'QR_CODE',
//   RSS_14 = 'RSS_14', // Android only
//   RSS_EXPANDED = 'RSS_EXPANDED', // Android only
// }

// export interface ScanOptions {
//   targetedFormats?: [SupportedFormat];
// }

export interface ScanResult {
  hasContent: boolean;
  code?: string;
}

// export interface CheckPermissionOptions {
//   force?: boolean;
// }

// export interface CheckPermissionResult {
//   granted?: boolean;
//   denied?: boolean;
//   asked?: boolean;
//   neverAsked?: boolean;
//   restricted?: boolean; // ios only
//   unknown?: boolean; // ios only
// }

export type CameraPosition = 'rear' | 'front';

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
