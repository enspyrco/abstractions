# types_for_perception

Interfaces implemented in astro and used as types in apps using astro.

## Features

This package defines interfaces that are implemented in several astro packages.

The purpose of the package is:

- achieve loose coupling by following the [Dependency Inversion Principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle)
- provide annotations used by builders_for_perception and packages that use builders_for_perception for source gen

### Public libraries

Each dart file directly under `lib/` is a public library that any package using
`types_for_perception` can import.

### Annotations

We use Dart's `build` package to perform static metaprogramming in apps using `astro`.

An app using astro adds `builders_for_perception` & `build_runner` as dev dependencies but
annotations need to be added as a dependency (not a dev dependency) so they can be
imported in the app code. So we put the annotations in a separate package (this package!)

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
