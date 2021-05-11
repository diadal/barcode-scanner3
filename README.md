# @diadal/barcode-scanner

A fast and efficient (QR) barcode scanner for Capacitor

## Install

```bash
npm install @diadal/barcode-scanner
npx cap sync
```


```Vue

window.document.body.classList.add('qrscanner');

import { BarcodeScanner } from '@diadal/barcode-scanner';

BarcodeScanner.startScan()
.then((result) => {
window.document.body.classList.remove('qrscanner');

          console.log('result222cc', result);
        })
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        .catch((error: any) => {
          window.document.body.classList.remove('qrscanner');

          console.log('error333', error);
        });


```

## API

<docgen-index>

- [@diadal/barcode-scanner](#diadalbarcode-scanner)
  - [Install](#install)
  - [API](#api)
    - [echo(...)](#echo)
    - [prepare()](#prepare)
    - [hideBackground()](#hidebackground)
    - [showBackground()](#showbackground)
    - [startScan()](#startscan)
    - [stopScan()](#stopscan)
    - [checkPermission(...)](#checkpermission)
    - [openAppSettings()](#openappsettings)
    - [Interfaces](#interfaces)
      - [ScanResult](#scanresult)
      - [CheckPermissionResult](#checkpermissionresult)
      - [CheckPermissionOptions](#checkpermissionoptions)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### prepare()

```typescript
prepare() => Promise<void>
```

--------------------


### hideBackground()

```typescript
hideBackground() => Promise<void>
```

--------------------


### showBackground()

```typescript
showBackground() => Promise<void>
```

--------------------


### startScan()

```typescript
startScan() => Promise<ScanResult>
```

**Returns:** <code>Promise&lt;<a href="#scanresult">ScanResult</a>&gt;</code>

--------------------


### stopScan()

```typescript
stopScan() => Promise<void>
```

--------------------


### checkPermission(...)

```typescript
checkPermission(options: CheckPermissionOptions) => Promise<CheckPermissionResult>
```

| Param         | Type                                                                      |
| ------------- | ------------------------------------------------------------------------- |
| **`options`** | <code><a href="#checkpermissionoptions">CheckPermissionOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#checkpermissionresult">CheckPermissionResult</a>&gt;</code>

--------------------


### openAppSettings()

```typescript
openAppSettings() => Promise<void>
```

--------------------


### Interfaces


#### ScanResult

| Prop             | Type                 |
| ---------------- | -------------------- |
| **`hasContent`** | <code>boolean</code> |
| **`content`**    | <code>string</code>  |


#### CheckPermissionResult

| Prop             | Type                 |
| ---------------- | -------------------- |
| **`granted`**    | <code>boolean</code> |
| **`denied`**     | <code>boolean</code> |
| **`asked`**      | <code>boolean</code> |
| **`neverAsked`** | <code>boolean</code> |
| **`restricted`** | <code>boolean</code> |
| **`unknown`**    | <code>boolean</code> |


#### CheckPermissionOptions

| Prop        | Type                 |
| ----------- | -------------------- |
| **`force`** | <code>boolean</code> |

</docgen-api>
