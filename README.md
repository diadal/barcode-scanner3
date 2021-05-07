# @diadal/barcode-scanner

A fast and efficient (QR) barcode scanner for Capacitor

## Install

```bash
npm install @diadal/barcode-scanner
npx cap sync
```

## API

<docgen-index>

* [`prepare()`](#prepare)
* [`hideBackground()`](#hidebackground)
* [`showBackground()`](#showbackground)
* [`startScan(...)`](#startscan)
* [`stopScan()`](#stopscan)
* [`checkPermission(...)`](#checkpermission)
* [`openAppSettings()`](#openappsettings)
* [Interfaces](#interfaces)
* [Enums](#enums)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

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


### startScan(...)

```typescript
startScan(options: ScanOptions) => Promise<ScanResult>
```

| Param         | Type                                                |
| ------------- | --------------------------------------------------- |
| **`options`** | <code><a href="#scanoptions">ScanOptions</a></code> |

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


#### ScanOptions

| Prop                  | Type                           |
| --------------------- | ------------------------------ |
| **`targetedFormats`** | <code>[SupportedFormat]</code> |


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


### Enums


#### SupportedFormat

| Members                 | Value                            |
| ----------------------- | -------------------------------- |
| **`UPC_A`**             | <code>'UPC_A'</code>             |
| **`UPC_E`**             | <code>'UPC_E'</code>             |
| **`UPC_EAN_EXTENSION`** | <code>'UPC_EAN_EXTENSION'</code> |
| **`EAN_8`**             | <code>'EAN_8'</code>             |
| **`EAN_13`**            | <code>'EAN_13'</code>            |
| **`CODE_39`**           | <code>'CODE_39'</code>           |
| **`CODE_39_MOD_43`**    | <code>'CODE_39_MOD_43'</code>    |
| **`CODE_93`**           | <code>'CODE_93'</code>           |
| **`CODE_128`**          | <code>'CODE_128'</code>          |
| **`CODABAR`**           | <code>'CODABAR'</code>           |
| **`ITF`**               | <code>'ITF'</code>               |
| **`ITF_14`**            | <code>'ITF_14'</code>            |
| **`AZTEC`**             | <code>'AZTEC'</code>             |
| **`DATA_MATRIX`**       | <code>'DATA_MATRIX'</code>       |
| **`MAXICODE`**          | <code>'MAXICODE'</code>          |
| **`PDF_417`**           | <code>'PDF_417'</code>           |
| **`QR_CODE`**           | <code>'QR_CODE'</code>           |
| **`RSS_14`**            | <code>'RSS_14'</code>            |
| **`RSS_EXPANDED`**      | <code>'RSS_EXPANDED'</code>      |

</docgen-api>
