# asdf-perl

[![Build Status](https://travis-ci.org/ouest/asdf-perl.svg?branch=master)](https://travis-ci.org/ouest/asdf-perl)

Perl plugin for asdf version manager

## Install

```
asdf plugin add perl
```

## Use

Check out the [asdf](https://github.com/asdf-vm/asdf) readme for instructions.

## Default perl modules

asdf-perl can automatically install a set of default perl modules right after
installing a perl version. To enable this feature, provide a
`$HOME/.default-perl-modules` file that lists one module per line, for example:

```
App::Ack
CGI
HTML::Template
```

You can specify a non-default location of this file by setting a `ASDF_PERL_DEFAULT_PACKAGES_FILE` variable.
