# @diadal/barcode-scanner

A fast and efficient (QR) barcode scanner for Capacitor

## Install

```bash
npm install @diadal/barcode-scanner
npx cap sync
```


```Vue



import { BarcodeScanner } from '@diadal/barcode-scanner';


function Scaner() {

      window.document.body.classList.add('qrscanner');
      BarcodeScanner.startScan()
        .then((result: ScanResult) => {
          window.document.body.classList.remove('qrscanner');
          console.log('result222cc', result);
        })
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        .catch((error: any) => {
          window.document.body.classList.remove('qrscanner');
          console.log('error333', error);
        });
    }


```

```scss


.scanner-ui {
display: none;
}
.scanner-hide {
visibility: visible;
}

body.qrscanner {
background-color: transparent;
}
body.qrscanner .scanner-ui {
display: block;
}
body.qrscanner .scanner-hide {
visibility: hidden;
}

.ion-content {
--background: transparent;
}

ion-content {
--background: transparent;
}


```

## Thansk To [https://github.com/capacitor-community/camera-preview
](camera-preview)


## API

<docgen-index>

* [`startScan()`](#startscan)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### startScan()

```typescript
startScan() => Promise<ScanResult>
```

**Returns:** <code>Promise&lt;<a href="#scanresult">ScanResult</a>&gt;</code>

--------------------


### Interfaces


#### ScanResult

| Prop             | Type                 |
| ---------------- | -------------------- |
| **`hasContent`** | <code>boolean</code> |
| **`code`**       | <code>string</code>  |

</docgen-api>
