# Changelog

## [0.4.0](https://github.com/ouest/asdf-perl/compare/v0.3.1...v0.4.0) (2026-08-11)


### Features

* log output of default module installation ([ad8e759](https://github.com/ouest/asdf-perl/commit/ad8e759ab38ef09f3fe19a2c09b1888f32109b65))


### Bug Fixes

* don't need explicit exit code check ([3f56e7c](https://github.com/ouest/asdf-perl/commit/3f56e7c6380cb5bafbfb4bd8612cac34290e667a))
* don't pass empty string to cpanm if ASDF_PERL_CPANM_ARGS is not set ([6dcf4ec](https://github.com/ouest/asdf-perl/commit/6dcf4ecfef85eb36d8d6f266e5399fb5f10952aa))
* log dir name ([2034e6e](https://github.com/ouest/asdf-perl/commit/2034e6efcc9936364b7ea84840a26200d9bd60c3))
* mkdir log directory ([b593287](https://github.com/ouest/asdf-perl/commit/b593287a9474044b9927dcd4737406210053e513))
* parse ASDF_PERL_CPANM_ARGS into array ([7b151bf](https://github.com/ouest/asdf-perl/commit/7b151bfa0165fb885629fd92d188b513b61bf680))

### [0.3.1](https://www.github.com/ouest/asdf-perl/compare/v0.3.0...v0.3.1) (2025-12-10)


### Bug Fixes

* Correctly parse ASDF_PERL_BUILD_ARGS into configure arguments ([50cf952](https://www.github.com/ouest/asdf-perl/commit/50cf952f5e2692e8044ef569e421b18474057fde))

## [0.3.0](https://www.github.com/ouest/asdf-perl/compare/v0.2.1...v0.3.0) (2025-08-10)


### Features

* do not test modules to be installed with cpanm ([88037e3](https://www.github.com/ouest/asdf-perl/commit/88037e35f577022e22b2af074c669096fee5862a))


### Bug Fixes

* 🩹 let options come from the lines in the packages file ([0c24bce](https://www.github.com/ouest/asdf-perl/commit/0c24bcee29a952ad249846ede50e2486668eebcc))
* 🩹 let the notest option come from an env var ([2b3a5ef](https://www.github.com/ouest/asdf-perl/commit/2b3a5ef231d54ea68a17c8ddbd75876ebabebb9d))
