/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable @typescript-eslint/require-await */
import { WebPlugin } from '@capacitor/core';

import type {
  BarcodeScannerPlugin,
  // CheckPermissionOptions,
  // CheckPermissionResult,
  ScanResult,
} from './definitions';

export class BarcodeScannerWeb
  extends WebPlugin
  implements BarcodeScannerPlugin {
  // async prepare(): Promise<void> {
  //   throw new Error('Method not implemented.');
  // }
  // async hideBackground(): Promise<void> {
  //   throw new Error('Method not implemented.');
  // }
  // async showBackground(): Promise<void> {
  //   throw new Error('Method not implemented.');
  // }
  async startScan(): Promise<ScanResult> {
    throw new Error('Method not implemented.');
  }
  // async stopScan(): Promise<void> {
  //   throw new Error('Method not implemented.');
  // }
  // async checkPermission(
  //   _options: CheckPermissionOptions,
  // ): Promise<CheckPermissionResult> {
  //   throw new Error('Method not implemented.');
  // }
  // async openAppSettings(): Promise<void> {
  //   throw new Error('Method not implemented.');
  // }
  // async echo(options: { value: string }): Promise<{ value: string }> {
  //   return options;
  // }
}
