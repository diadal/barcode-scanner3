'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var core = require('@capacitor/core');

const BarcodeScanner = core.registerPlugin('BarcodeScanner', {
    web: () => Promise.resolve().then(function () { return web; }).then(m => new m.BarcodeScannerWeb()),
});

/* eslint-disable @typescript-eslint/no-unused-vars */
class BarcodeScannerWeb extends core.WebPlugin {
    // async prepare(): Promise<void> {
    //   throw new Error('Method not implemented.');
    // }
    // async hideBackground(): Promise<void> {
    //   throw new Error('Method not implemented.');
    // }
    // async showBackground(): Promise<void> {
    //   throw new Error('Method not implemented.');
    // }
    async startScan(_data) {
        throw new Error('Method not implemented.');
    }
}

var web = /*#__PURE__*/Object.freeze({
    __proto__: null,
    BarcodeScannerWeb: BarcodeScannerWeb
});

exports.BarcodeScanner = BarcodeScanner;
//# sourceMappingURL=plugin.cjs.js.map
