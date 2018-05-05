# Arez-DevTools

[![Build Status](https://secure.travis-ci.org/arez/arez-devtools.png?branch=master)](http://travis-ci.org/arez/arez-devtools)
[<img src="https://img.shields.io/maven-central/v/org.realityforge.arez.devtools/arez-devtools.svg?label=latest%20release"/>](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.realityforge.arez.devtools%22)

This is the home of the browser-based Arez DevTools. It is an early stage experiment not suitable for
production use and likely to experience significant evolution.

## Quick Start

The simplest way to use the DevTools is to run the buildr command:

    $ bundle exec buildr unpack_extension

This will build the extension in directory `<arez-devtools-dir>/browser_extension/` although the location can be
overridden by setting the `EXTENSION_DIR=some/path/to/extension` when running buildr such as

    $ bundle exec buildr unpack_extension EXTENSION_DIR=some/path/to/extension

This can be added to chrome by visiting `chrome://extensions/`, enabling `Developer Mode` and clicking
`Load Unpacked` button and loading the extension. After that it is time to play.

# More Information

For more information about component, please see the [Website](https://arez.github.io/arez-devtools). For the
source code and project support please visit the [GitHub project](https://github.com/arez/arez-devtools).

# Contributing

The component was released as open source so others could benefit from the project. We are thankful for any
contributions from the community. A [Code of Conduct](CODE_OF_CONDUCT.md) has been put in place and
a [Contributing](CONTRIBUTING.md) document is under development.

# License

The component is licensed under [Apache License, Version 2.0](LICENSE).
