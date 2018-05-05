# TODO

This document is essentially a list of shorthand notes describing work yet to completed.
Unfortunately it is not complete enough for other people to pick work off the list and
complete as there is too much un-said.

## Enhancements

Build the equivalent of Mobx DevTools. We already support a reasonable console logging but need
mechanisms to enable and disable. Possibly we also need to support looking at dependencies of components. Do we
do this by caching arez components on WeakHashmap in componentDidMount/componentWillUnmount and then supporting
accessing transitive dependency tree via UI?

Possibly we also need the ability to browse the repositories in the application. Register repositories on
startup and then browse via tables?

Once this is done remove the setting of dependencies in state as can trigger infinite state updates in some scenarios.

* Maybe as simple as outputting tables ala

```javascript
var languages = { csharp: { name: "C#", paradigm: "object-oriented" }, fsharp: { name: "F#", paradigm: "functional" } };
console.table(languages);
```

* Probably the best way is define a browser extension:
  - https://github.com/zalmoxisus/redux-devtools-extension.git
  - https://github.com/andykog/mobx-devtools
  - https://developer.chrome.com/extensions/overview
  - https://developer.chrome.com/extensions/getstarted
  - https://developer.chrome.com/extensions/devguide
  - https://developer.chrome.com/extensions/devtools
  - https://www.smashingmagazine.com/2017/04/browser-extension-edge-chrome-firefox-opera-brave-vivaldi/
  - https://developer.mozilla.org/en-US/Add-ons/WebExtensions/API/devtools.panels (Firefox Browser)
  - https://docs.microsoft.com/en-us/microsoft-edge/extensions/api-support (Edge Browser)
