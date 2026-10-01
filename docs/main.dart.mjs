// Compiles a dart2wasm-generated main module from `source` which can then
// be instantiated via the `instantiate` method.
//
// `source` needs to be a `Response` object (or promise thereof) e.g. created
// via the `fetch()` JS API.
export async function compileStreaming(source) {
  const builtins = {builtins: ['js-string']};
  return new CompiledApp(
      await WebAssembly.compileStreaming(source, builtins), builtins);
}

// Compiles a dart2wasm-generated wasm module from `bytes` which is then
// instantiable via the `instantiate` method.
export async function compile(bytes) {
  const builtins = {builtins: ['js-string']};
  return new CompiledApp(await WebAssembly.compile(bytes, builtins), builtins);
}

class CompiledApp {
  constructor(module, builtins) {
    this.module = module;
    this.builtins = builtins;
  }

  // The second argument is an options object containing:
  // `loadDeferredModules` is a JS function that takes an array of module names
  //   matching wasm files produced by the dart2wasm compiler. It also takes a
  //   callback that should be invoked for each loaded module with 2 arguments:
  //   (1) the module name, (2) the loaded module in a format supported by
  //   `WebAssembly.compile` or `WebAssembly.compileStreaming`. The callback
  //   returns a Promise that resolves when the module is instantiated.
  //   loadDeferredModules should return a Promise that resolves when all the
  //   modules have been loaded and the callback promises have resolved.
  // `loadDeferredId` is a JS function that takes load ID produced by the
  //   compiler when the `use-load-ids` option is passed. Each load ID maps to
  //   one or more wasm files as specified in the emitted JSON file. It also
  //   takes a callback that should be invoked for each loaded module with 2
  //   arguments: (1) the module name, (2) the loaded module in a format
  //   supported by `WebAssembly.compile` or `WebAssembly.compileStreaming`.
  //   The callback returns a Promise that resolves when the module is
  //   instantiated.
  //   loadDeferredId should return a Promise that resolves when all the
  //   modules have been loaded and the callback promises have resolved.
  async instantiate(additionalImports, {loadDeferredModules, loadDeferredId} = {}) {
    let dartInstance;

    // Prints to the console
    function printToConsole(value) {
      if (typeof dartPrint == "function") {
        dartPrint(value);
        return;
      }
      if (typeof console == "object" && typeof console.log != "undefined") {
        console.log(value);
        return;
      }
      if (typeof print == "function") {
        print(value);
        return;
      }

      throw "Unable to print message: " + value;
    }

    // A special symbol attached to functions that wrap Dart functions.
    const jsWrappedDartFunctionSymbol = Symbol("JSWrappedDartFunction");

    function finalizeWrapper(dartFunction, wrapped) {
      wrapped.dartFunction = dartFunction;
      wrapped[jsWrappedDartFunctionSymbol] = true;
      return wrapped;
    }

    // Imports
    const dart2wasm = {
            AB: x0 => new Int16Array(x0),
      AC: (o, start, length) => new Uint8Array(o.buffer, o.byteOffset + start, length),
      AD: x0 => x0.tabIndex,
      AE: (x0,x1) => x0.getComputedStyle(x1),
      AF: x0 => x0.tiltY,
      AG: x0 => x0.now(),
      AH: (x0,x1) => x0.lock(x1),
      AI: (x0,x1) => { x0.height = x1 },
      B: s => printToConsole(s),
      BB: x0 => new Uint16Array(x0),
      BC: (o, start, length) => new Int8Array(o.buffer, o.byteOffset + start, length),
      BD: (x0,x1) => x0.contains(x1),
      BE: x0 => x0.documentElement,
      BF: x0 => x0.tiltX,
      BG: x0 => x0.performance,
      BH: x0 => x0.orientation,
      BI: (x0,x1) => { x0.width = x1 },
      C: Function.prototype.call.bind(Number.prototype.toString),
      CB: x0 => new Int32Array(x0),
      CC: (x0,x1) => x0.querySelector(x1),
      CD: x0 => x0.activeElement,
      CE: x0 => x0.computedStyleMap(),
      CF: x0 => x0.pointerType,
      CG: (d, digits) => d.toFixed(digits),
      CH: (x0,x1) => x0.querySelector(x1),
      CI: x0 => x0.height,
      D: Function.prototype.call.bind(BigInt.prototype.toString),
      DB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmI32ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      DC: (x0,x1) => x0.item(x1),
      DD: x0 => x0.parentNode,
      DE: (x0,x1) => x0.get(x1),
      DF: x0 => x0.pointerId,
      DG: x0 => x0.maxHeight,
      DH: (x0,x1) => { x0.title = x1 },
      DI: x0 => x0.width,
      E: (exn) => {
        let stackString = exn.toString();
        let frames = stackString.split('\n');
        let drop = 4;
        if (frames[0].startsWith('Error')) {
            drop += 1;
        }
        return frames.slice(drop).join('\n');
      },
      EB: x0 => new Uint32Array(x0),
      EC: x0 => x0.length,
      ED: x0 => x0.tagName,
      EE: (o, p) => p in o,
      EF: x0 => x0.getCoalescedEvents(),
      EG: x0 => x0.maxWidth,
      EH: (x0,x1) => x0.vibrate(x1),
      EI: x0 => x0.rasterEndMilliseconds,
      F: () => new Error().stack,
      FB: x0 => new Float32Array(x0),
      FC: (x0,x1) => x0.querySelectorAll(x1),
      FD: x0 => x0.target,
      FE: (x0,x1) => { x0.textContent = x1 },
      FF: (x0,x1) => x0.getModifierState(x1),
      FG: x0 => x0.minHeight,
      FH: x0 => x0.arrayBuffer(),
      FI: x0 => x0.rasterStartMilliseconds,
      G: s => JSON.stringify(s),
      GB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmF32ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      GC: (x0,x1) => x0.getAttribute(x1),
      GD: x0 => x0.clientY,
      GE: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      GF: s => s.trimLeft(),
      GG: x0 => x0.minWidth,
      GH: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof ArrayBuffer) return 1;
        if (globalThis.SharedArrayBuffer !== undefined &&
            o instanceof SharedArrayBuffer) {
          return 2;
        }
        return 3;
      },
      GI: x0 => x0.imageBitmaps,
      H: Function.prototype.call.bind(Number.prototype.toString),
      HB: x0 => new Float64Array(x0),
      HC: x0 => x0.remove(),
      HD: x0 => x0.clientX,
      HE: x0 => x0.matches,
      HF: s => s.toUpperCase(),
      HG: (x0,x1) => x0.removeProperty(x1),
      HH: x0 => x0.status,
      HI: x0 => x0.canvasKitMaximumSurfaces,
      I: Function.prototype.call.bind(String.prototype.indexOf),
      IB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmF64ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      IC: (x0,x1) => x0.appendChild(x1),
      ID: (x0,x1,x2) => x0.setAttribute(x1,x2),
      IE: (x0,x1) => x0.matchMedia(x1),
      IF: (x0,x1) => x0.test(x1),
      IG: (x0,x1) => x0.add(x1),
      IH: (x0,x1) => x0.fetch(x1),
      II: x0 => x0.debugSkipFontRetryDelay,
      J: (s, p, i) => s.lastIndexOf(p, i),
      JB: x0 => new ArrayBuffer(x0),
      JC: (x0,x1) => x0.append(x1),
      JD: x0 => x0.getBoundingClientRect(),
      JE: x0 => x0.matches,
      JF: (x0,x1) => x0[x1],
      JG: x0 => x0.data,
      JH: x0 => x0.content,
      JI: (x0,x1,x2) => x0.set(x1,x2),
      K: (exn) => {
        if (exn instanceof Error) {
          return exn.stack;
        } else {
          return null;
        }
      },
      KB: (x0,x1,x2) => new Uint8Array(x0,x1,x2),
      KC: (x0,x1,x2,x3) => x0.setProperty(x1,x2,x3),
      KD: (ms, c) =>
      setTimeout(() => dartInstance.exports.$invokeCallback(c),ms),
      KE: o => typeof o === 'function' && o[jsWrappedDartFunctionSymbol] === true,
      KF: x0 => x0.index,
      KG: (x0,x1) => { x0.scrollTop = x1 },
      KH: x0 => x0.document,
      KI: x0 => x0.fontFallbackBaseUrl,
      L: o => o === undefined,
      LB: (x0,x1,x2) => new DataView(x0,x1,x2),
      LC: x0 => x0.style,
      LD: s => new Date(s * 1000).getTimezoneOffset() * 60,
      LE: f => f.dartFunction,
      LF: x0 => x0.flags,
      LG: (x0,x1,x2) => x0.setSelectionRange(x1,x2),
      LH: () => typeof dartUseDateNowForTicks !== "undefined",
      LI: (a, i) => a.splice(i, 1),
      M: o => String(o),
      MB: (o, p) => o[p],
      MC: x0 => x0.debugShowSemanticsNodes,
      MD: Date.now,
      ME: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      MF: (a, s) => a.join(s),
      MG: (x0,x1) => { x0.value = x1 },
      MH: () => Date.now(),
      MI: a => a.pop(),
      N: (c) =>
      queueMicrotask(() => dartInstance.exports.$invokeCallback(c)),
      NB: (o) => new DataView(o.buffer, o.byteOffset, o.byteLength),
      NC: o => o,
      ND: (handle) => clearTimeout(handle),
      NE: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1) { return wasmFunction(f,arguments.length,x0,x1) }),
      NF: (x0,x1) => x0.error(x1),
      NG: (x0,x1,x2) => x0.setSelectionRange(x1,x2),
      NH: () => 1000 * performance.now(),
      NI: (x0,x1) => x0.getRandomValues(x1),
      O: (x0,x1) => x0.didCreateEngineInitializer(x1),
      OB: Function.prototype.call.bind(Object.getOwnPropertyDescriptor(DataView.prototype, 'byteLength').get),
      OC: o => {
        if (o === undefined || o === null) return 0;
        if (typeof o === 'boolean') return 1;
        return 2;
      },
      OD: (x0,x1) => x0.closest(x1),
      OE: (p, s, f) => p.then(s, (e) => f(e, e === undefined)),
      OF: () => globalThis.console,
      OG: (x0,x1) => { x0.value = x1 },
      OH: x0 => new Uint8Array(x0),
      OI: () => globalThis.crypto,
      P: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      PB: o => o.byteOffset,
      PC: (x0,x1) => x0.warn(x1),
      PD: x0 => x0.bottom,
      PE: (o, i) => o[i],
      PF: s => s.trimRight(),
      PG: s => {
        if (/[[\]{}()*+?.\\^$|]/.test(s)) {
            s = s.replace(/[[\]{}()*+?.\\^$|]/g, '\\$&');
        }
        return s;
      },
      PH: (x0,x1,x2) => x0.slice(x1,x2),
      PI: l => new DataView(new ArrayBuffer(l)),
      Q: (wasmFunction,f) => finalizeWrapper(f, function() { return wasmFunction(f,arguments.length) }),
      QB: o => o.buffer,
      QC: x0 => x0.console,
      QD: x0 => x0.top,
      QE: o => o.length,
      QF: x0 => x0.blur(),
      QG: x0 => x0.value,
      QH: (x0,x1) => x0.decode(x1),
      QI: (map, o) => map.get(o),
      R: (x0,x1) => ({initializeEngine: x0,autoStart: x1}),
      RB: Function.prototype.call.bind(DataView.prototype.getUint8),
      RC: () => globalThis.window,
      RD: x0 => x0.right,
      RE: o => {
        if (o === undefined) return 1;
        var type = typeof o;
        if (type === 'boolean') return 2;
        if (type === 'number') return 3;
        if (type === 'string') return 4;
        if (o instanceof Array) return 5;
        if (ArrayBuffer.isView(o)) {
          if (o instanceof Int8Array) return 6;
          if (o instanceof Uint8Array) return 7;
          if (o instanceof Uint8ClampedArray) return 8;
          if (o instanceof Int16Array) return 9;
          if (o instanceof Uint16Array) return 10;
          if (o instanceof Int32Array) return 11;
          if (o instanceof Uint32Array) return 12;
          if (o instanceof Float32Array) return 13;
          if (o instanceof Float64Array) return 14;
          if (o instanceof DataView) return 15;
        }
        if (o instanceof ArrayBuffer) return 16;
        // Feature check for `SharedArrayBuffer` before doing a type-check.
        if (globalThis.SharedArrayBuffer !== undefined &&
            o instanceof SharedArrayBuffer) {
            return 17;
        }
        if (o instanceof Promise) return 18;
        return 19;
      },
      RF: x0 => x0.button,
      RG: x0 => x0.selectionDirection,
      RH: (x0,x1) => x0.adoptText(x1),
      RI: () => new WeakMap(),
      S: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1) { return wasmFunction(f,arguments.length,x0,x1) }),
      SB: (b, o) => new DataView(b, o),
      SC: (o, c) => o instanceof c,
      SD: x0 => x0.left,
      SE: x0 => x0.language,
      SF: x0 => x0.innerHeight,
      SG: x0 => x0.selectionStart,
      SH: x0 => x0.first(),
      SI: x0 => new WeakRef(x0),
      T: x0 => new Promise(x0),
      TB: (b, o, l) => new DataView(b, o, l),
      TC: (x0,x1) => x0.exec(x1),
      TD: x0 => x0.clientY,
      TE: (x0,x1,x2,x3) => x0.register(x1,x2,x3),
      TF: x0 => x0.innerWidth,
      TG: x0 => x0.selectionEnd,
      TH: x0 => x0.next(),
      TI: x0 => x0.deref(),
      U: (x0,x1,x2) => x0.call(x1,x2),
      UB: Function.prototype.call.bind(DataView.prototype.getFloat64),
      UC: x0 => x0.length,
      UD: x0 => x0.clientX,
      UE: () => globalThis.window.FinalizationRegistry,
      UF: x0 => x0.height,
      UG: x0 => x0.value,
      UH: x0 => x0.current(),
      UI: () => globalThis.WeakRef,
      V: (constructor, args) => {
        const factoryFunction = constructor.bind.apply(
            constructor, [null, ...args]);
        return new factoryFunction();
      },
      VB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Float64Array) return 1;
        return 2;
      },
      VC: (x0,x1) => { x0.lastIndex = x1 },
      VD: x0 => x0.changedTouches,
      VE: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      VF: x0 => x0.width,
      VG: x0 => x0.selectionDirection,
      VH: (x0,x1) => new Intl.v8BreakIterator(x0,x1),
      VI: (map, o, v) => map.set(o, v),
      W: x0 => new Array(x0),
      WB: Function.prototype.call.bind(DataView.prototype.setFloat64),
      WC: (s, m) => {
        try {
          return new RegExp(s, m);
        } catch (e) {
          return String(e);
        }
      },
      WD: x0 => x0.offsetY,
      WE: x0 => new window.FinalizationRegistry(x0),
      WF: x0 => x0.clientHeight,
      WG: x0 => x0.selectionStart,
      WH: x0 => x0.v8BreakIterator,
      WI: (o, offsetInBytes, lengthInBytes) => {
        var dst = new ArrayBuffer(lengthInBytes);
        new Uint8Array(dst).set(new Uint8Array(o, offsetInBytes, lengthInBytes));
        return new DataView(dst);
      },
      X: o => [o],
      XB: (t, s) => t.set(s),
      XC: o => o instanceof RegExp,
      XD: x0 => x0.offsetX,
      XE: (x0,x1) => x0.unregister(x1),
      XF: x0 => x0.clientWidth,
      XG: x0 => x0.selectionEnd,
      XH: () => globalThis.Intl,
      XI: (a, s, e) => a.slice(s, e),
      Y: (o0, o1) => [o0, o1],
      YB: Function.prototype.call.bind(DataView.prototype.setFloat32),
      YC: (string, times) => string.repeat(times),
      YD: x0 => x0.type,
      YE: (x0,x1) => x0.contains(x1),
      YF: (x0,x1) => { x0.content = x1 },
      YG: x0 => x0.keyCode,
      YH: (x0,x1) => x0.segment(x1),
      YI: (handle) => clearInterval(handle),
      Z: (o0, o1, o2) => [o0, o1, o2],
      ZB: Function.prototype.call.bind(DataView.prototype.getFloat32),
      ZC: x0 => x0.dotAll,
      ZD: x0 => x0.maxTouchPoints,
      ZE: (s) => +s,
      ZF: (x0,x1) => { x0.name = x1 },
      ZG: (x0,x1) => x0.scrollIntoView(x1),
      ZH: x0 => x0.index,
      ZI: (ms, c) =>
      setInterval(() => dartInstance.exports.$invokeCallback(c), ms),
      a: (o0, o1, o2, o3) => [o0, o1, o2, o3],
      aB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Float32Array) return 1;
        return 2;
      },
      aC: x0 => x0.unicode,
      aD: x0 => x0.platform,
      aE: s => {
        if (!/^\s*[+-]?(?:Infinity|NaN|(?:\.\d+|\d+(?:\.\d*)?)(?:[eE][+-]?\d+)?)\s*$/.test(s)) {
          return NaN;
        }
        return parseFloat(s);
      },
      aF: x0 => x0.head,
      aG: x0 => x0.multiViewEnabled,
      aH: x0 => x0.next(),
      aI: () => Date.now(),
      b: (x0,x1,x2) => { x0[x1] = x2 },
      bB: Function.prototype.call.bind(DataView.prototype.getUint32),
      bC: x0 => x0.ignoreCase,
      bD: x0 => x0.body,
      bE: s => s.trim(),
      bF: (x0,x1) => x0.removeChild(x1),
      bG: (x0,x1) => x0.replaceWith(x1),
      bH: x0 => x0.value,
      bI: x0 => x0.hostElement,
      c: o => o,
      cB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Uint32Array) return 1;
        return 2;
      },
      cC: x0 => x0.multiline,
      cD: () => globalThis.document,
      cE: x0 => x0.classList,
      cF: x0 => x0.firstChild,
      cG: (x0,x1) => { x0.type = x1 },
      cH: x0 => x0.done,
      cI: x0 => x0.location,
      d: (o, p) => o[p],
      dB: Function.prototype.call.bind(DataView.prototype.getInt32),
      dC: (string, token) => string.split(token),
      dD: (x0,x1,x2) => x0.addEventListener(x1,x2),
      dE: x0 => x0.preventDefault(),
      dF: x0 => x0.viewConstraints,
      dG: (x0,x1) => { x0.className = x1 },
      dH: (o, m, a) => o[m].apply(o, a),
      dI: (x0,x1) => x0.getModifierState(x1),
      e: () => globalThis,
      eB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Int32Array) return 1;
        return 2;
      },
      eC: o => o instanceof Array,
      eD: x0 => x0.hasFocus(),
      eE: x0 => x0.parent,
      eF: x0 => x0.hostElement,
      eG: (x0,x1) => { x0.tabIndex = x1 },
      eH: x0 => x0.iterator,
      eI: x0 => x0.metaKey,
      f: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      fB: o => o instanceof Uint16Array,
      fC: (a, i) => a[i],
      fD: x0 => x0.relatedTarget,
      fE: x0 => x0.timeStamp,
      fF: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      fG: (x0,x1) => { x0.name = x1 },
      fH: () => globalThis.Symbol,
      fI: x0 => x0.altKey,
      g: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      gB: Function.prototype.call.bind(DataView.prototype.getUint16),
      gC: a => a.length,
      gD: x0 => x0.shiftKey,
      gE: (x0,x1) => x0.hasAttribute(x1),
      gF: x0 => ({runApp: x0}),
      gG: (x0,x1) => { x0.placeholder = x1 },
      gH: (x0,x1) => new Intl.Segmenter(x0,x1),
      gI: x0 => x0.ctrlKey,
      h: (x0,x1) => ({addView: x0,removeView: x1}),
      hB: o => o instanceof Int16Array,
      hC: x0 => x0.userAgent,
      hD: (decoder, codeUnits) => decoder.decode(codeUnits),
      hE: x0 => x0.buttons,
      hF: Function.prototype.call.bind(DataView.prototype.setBigInt64),
      hG: (x0,x1) => { x0.autocomplete = x1 },
      hH: x0 => x0.Segmenter,
      hI: x0 => x0.isComposing,
      i: (l, r) => l === r,
      iB: Function.prototype.call.bind(DataView.prototype.getInt16),
      iC: x0 => x0.navigator,
      iD: () => new TextDecoder("utf-8", {fatal: true}),
      iE: x0 => x0.ctrlKey,
      iF: (o, start, length) => new BigInt64Array(o.buffer, o.byteOffset + start, length),
      iG: (x0,x1) => { x0.name = x1 },
      iH: x0 => x0.buffer,
      iI: x0 => x0.code,
      j: x0 => x0.random(),
      jB: o => o instanceof Uint8ClampedArray,
      jC: Function.prototype.call.bind(String.prototype.toLowerCase),
      jD: () => new TextDecoder("utf-8", {fatal: false}),
      jE: x0 => x0.y,
      jF: Function.prototype.call.bind(DataView.prototype.getBigInt64),
      jG: (x0,x1) => { x0.placeholder = x1 },
      jH: x0 => x0.wasmMemory,
      jI: x0 => x0.repeat,
      k: o => o,
      kB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Uint8Array) return 1;
        return 2;
      },
      kC: Object.is,
      kD: (a, i, v) => a[i] = v,
      kE: x0 => x0.x,
      kF: (x0,x1,x2,x3) => x0.pushState(x1,x2,x3),
      kG: (x0,x1) => { x0.action = x1 },
      kH: () => globalThis.window._flutter_skwasmInstance,
      kI: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      l: o => {
        if (o === undefined || o === null) return 0;
        if (typeof o === 'number') return 1;
        return 2;
      },
      lB: Function.prototype.call.bind(DataView.prototype.setInt32),
      lC: x0 => x0.vendor,
      lD: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmI8ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      lE: x0 => x0.scrollTop,
      lF: x0 => x0.history,
      lG: (x0,x1) => { x0.method = x1 },
      lH: () => new TextDecoder(),
      lI: x0 => x0.length,
      m: () => globalThis.Math,
      mB: Function.prototype.call.bind(DataView.prototype.setUint32),
      mC: (x0,x1) => x0.createTextNode(x1),
      mD: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmI32ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      mE: x0 => x0.offsetTop,
      mF: x0 => x0.search,
      mG: (x0,x1) => { x0.noValidate = x1 },
      mH: (x0,x1,x2) => x0.insertBefore(x1,x2),
      mI: x0 => x0.getReader(),
      n: (x0,x1) => x0.prepend(x1),
      nB: Function.prototype.call.bind(DataView.prototype.setInt16),
      nC: (x0,x1) => { x0.id = x1 },
      nD: x0 => x0.visibilityState,
      nE: x0 => x0.scrollLeft,
      nF: x0 => x0.location,
      nG: (x0,x1) => x0.removeAttribute(x1),
      nH: x0 => x0.id,
      nI: x0 => x0.value,
      o: (x0,x1,x2,x3) => x0.addEventListener(x1,x2,x3),
      oB: Function.prototype.call.bind(DataView.prototype.setUint16),
      oC: (x0,x1) => { x0.nonce = x1 },
      oD: (x0,x1,x2) => x0.removeEventListener(x1,x2),
      oE: x0 => x0.offsetLeft,
      oF: x0 => x0.pathname,
      oG: x0 => x0.isConnected,
      oH: x0 => x0.offsetHeight,
      oI: x0 => x0.done,
      p: b => !!b,
      pB: Function.prototype.call.bind(DataView.prototype.setUint8),
      pC: x0 => x0.nonce,
      pD: x0 => x0.disconnect(),
      pE: x0 => x0.offsetParent,
      pF: (x0,x1,x2,x3) => x0.replaceState(x1,x2,x3),
      pG: x0 => x0.click(),
      pH: x0 => x0.offsetWidth,
      pI: x0 => x0.read(),
      q: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      qB: Function.prototype.call.bind(DataView.prototype.setInt8),
      qC: () => globalThis.window.flutterConfiguration,
      qD: x0 => new Intl.Locale(x0),
      qE: (o, p, r) => o.replaceAll(p, () => r),
      qF: o => {
        const proto = Object.getPrototypeOf(o);
        return proto === Object.prototype || proto === null;
      },
      qG: (x0,x1) => x0.getElementsByClassName(x1),
      qH: x0 => x0.stopPropagation(),
      qI: x0 => x0.body,
      r: (x0,x1) => x0.focus(x1),
      rB: Function.prototype.call.bind(DataView.prototype.getInt8),
      rC: (x0,x1) => x0.attachShadow(x1),
      rD: x0 => x0.region,
      rE: x0 => x0.deltaMode,
      rF: o => Object.keys(o),
      rG: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmF32ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      rH: x0 => x0.disabled,
      rI: (x0,x1) => new OffscreenCanvas(x0,x1),
      s: () => ({}),
      sB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Int8Array) return 1;
        return 2;
      },
      sC: (x0,x1) => x0.createElement(x1),
      sD: x0 => x0.script,
      sE: x0 => x0.deltaY,
      sF: x0 => x0.state,
      sG: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmF64ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      sH: (x0,x1) => { x0.min = x1 },
      sI: x0 => x0.assetBase,
      t: (o, p, v) => o[p] = v,
      tB: (o, start, length) => new Float64Array(o.buffer, o.byteOffset + start, length),
      tC: x0 => x0.scale,
      tD: x0 => x0.language,
      tE: x0 => x0.deltaX,
      tF: x0 => x0.hash,
      tG: (x0,x1) => x0.dispatchEvent(x1),
      tH: (x0,x1) => { x0.max = x1 },
      tI: x0 => x0.loader,
      u: () => [],
      uB: (o, start, length) => new Float32Array(o.buffer, o.byteOffset + start, length),
      uC: x0 => x0.visualViewport,
      uD: x0 => x0.languages,
      uE: x0 => x0.wheelDeltaY,
      uF: x0 => x0.state,
      uG: (x0,x1) => x0.createEvent(x1),
      uH: (x0,x1) => { x0.disabled = x1 },
      uI: () => globalThis._flutter,
      v: (a, i) => a.push(i),
      vB: (o, start, length) => new Uint32Array(o.buffer, o.byteOffset + start, length),
      vC: x0 => x0.devicePixelRatio,
      vD: (x0,x1) => x0.observe(x1),
      vE: x0 => x0.wheelDeltaX,
      vF: (x0,x1) => x0.go(x1),
      vG: (x0,x1,x2,x3) => x0.initEvent(x1,x2,x3),
      vH: (x0,x1) => { x0.scrollLeft = x1 },
      w: x0 => new Int8Array(x0),
      wB: (o, start, length) => new Int32Array(o.buffer, o.byteOffset + start, length),
      wC: x0 => x0.height,
      wD: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1) { return wasmFunction(f,arguments.length,x0,x1) }),
      wE: x0 => x0.key,
      wF: x0 => x0.parentElement,
      wG: x0 => x0.readText(),
      wH: (x0,x1) => { x0.spellcheck = x1 },
      x: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmI8ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      xB: (o, start, length) => new Uint16Array(o.buffer, o.byteOffset + start, length),
      xC: x0 => x0.width,
      xD: x0 => new ResizeObserver(x0),
      xE: x0 => x0.identifier,
      xF: (x0,x1) => x0.querySelectorAll(x1),
      xG: x0 => x0.clipboard,
      xH: (x0,x1) => { x0.disabled = x1 },
      y: x0 => new Uint8Array(x0),
      yB: (o, start, length) => new Int16Array(o.buffer, o.byteOffset + start, length),
      yC: x0 => x0.screen,
      yD: (x0,x1) => x0.getPropertyValue(x1),
      yE: x0 => x0.touches,
      yF: (x0,x1) => x0.requestAnimationFrame(x1),
      yG: (x0,x1) => x0.writeText(x1),
      yH: (x0,x1) => x0.transferFromImageBitmap(x1),
      z: x0 => new Uint8ClampedArray(x0),
      zB: (o, start, length) => new Uint8ClampedArray(o.buffer, o.byteOffset + start, length),
      zC: o => {
        if (o === null || o === undefined) return 0;
        if (typeof(o) === 'string') return 1;
        return 2;
      },
      zD: x0 => globalThis.parseFloat(x0),
      zE: x0 => x0.pressure,
      zF: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      zG: x0 => x0.unlock(),
      zH: (x0,x1) => x0.getContext(x1),

    };

    const baseImports = {
      _: dart2wasm,
      Math: Math,
      Date: Date,
      Object: Object,
      Array: Array,
      Reflect: Reflect,
      WebAssembly: {
        JSTag: WebAssembly.JSTag,
      },
      "": new Proxy({}, { get(_, prop) { return prop; } }),

    };

    const jsStringPolyfill = {
      "charCodeAt": (s, i) => s.charCodeAt(i),
      "compare": (s1, s2) => {
        if (s1 < s2) return -1;
        if (s1 > s2) return 1;
        return 0;
      },
      "concat": (s1, s2) => s1 + s2,
      "equals": (s1, s2) => s1 === s2,
      "fromCharCode": (i) => String.fromCharCode(i),
      "length": (s) => s.length,
      "substring": (s, a, b) => s.substring(a, b),
      "fromCharCodeArray": (a, start, end) => {
        if (end <= start) return '';

        const read = dartInstance.exports.$wasmI16ArrayGet;
        let result = '';
        let index = start;
        const chunkLength = Math.min(end - index, 500);
        let array = new Array(chunkLength);
        while (index < end) {
          const newChunkLength = Math.min(end - index, 500);
          for (let i = 0; i < newChunkLength; i++) {
            array[i] = read(a, index++);
          }
          if (newChunkLength < chunkLength) {
            array = array.slice(0, newChunkLength);
          }
          result += String.fromCharCode(...array);
        }
        return result;
      },
      "intoCharCodeArray": (s, a, start) => {
        if (s === '') return 0;

        const write = dartInstance.exports.$wasmI16ArraySet;
        for (var i = 0; i < s.length; ++i) {
          write(a, start++, s.charCodeAt(i));
        }
        return s.length;
      },
      "test": (s) => typeof s == "string",
    };


    

    dartInstance = await WebAssembly.instantiate(this.module, {
      ...baseImports,
      ...additionalImports,
      
      "wasm:js-string": jsStringPolyfill,
    });

    return new InstantiatedApp(this, dartInstance);
  }
}

class InstantiatedApp {
  constructor(compiledApp, instantiatedModule) {
    this.compiledApp = compiledApp;
    this.instantiatedModule = instantiatedModule;
  }

  // Call the main function with the given arguments.
  invokeMain(...args) {
    this.instantiatedModule.exports.$invokeMain(args);
  }
}
