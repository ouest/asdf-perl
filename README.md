<div align="center">

# asdf-perl [![Build](https://github.com/ouest/asdf-perl/actions/workflows/build.yml/badge.svg)](https://github.com/ouest/asdf-perl/actions/workflows/build.yml) [![Lint](https://github.com/ouest/asdf-perl/actions/workflows/lint.yml/badge.svg)](https://github.com/ouest/asdf-perl/actions/workflows/lint.yml)

[Perl](https://www.perl.org/) plugin for the [asdf version manager](https://asdf-vm.com).
</div>

# Install

Plugin:

```shell
asdf plugin add perl
# or
asdf plugin add grex https://github.com/ouest/asdf-perl.git
```

Perl:

```shell
# Show all installable stable versions
asdf list-all perl

# Install specific version
asdf install perl latest

# Set a version globally (on your ~/.tool-versions file)
asdf global perl latest

# Now Perl commands are available
perl --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to install & manage versions.

## Show all installable version of Perl
Set the `ASDF_PERL_DEVEL` environment variable to list development versions of Perl in addition to stable versions.
```
env ASDF_PERL_DEVEL=1 asdf list-all perl
```

## Set Perl build args
Set the `ASDF_PERL_BUILD_ARGS` environment variable to set build arguments for Perl installation.
```
env ASDF_PERL_BUILD_ARGS='-Dusemultiplicity -Duseshrplib' asdf install perl latest
```

## Generate man pages
Set the `ASDF_PERL_GENERATE_MAN` environment variable to generate the perl man pages.

```
env ASDF_PERL_GENERATE_MAN=1 asdf install perl latest
```

## Default perl modules

asdf-perl can automatically install a set of default Perl modules right after installed Perl.
To enable this feature, provide a `$HOME/.default-perl-modules` file that lists one module Per line, for example:

```
App::Ack
CGI
HTML::Template
```

You can specify a non-default location of this file by setting the `ASDF_PERL_DEFAULT_PACKAGES_FILE` environment variable.

