echoerr() {
  printf "\033[0;31m%s\033[0m" "$1" >&2
}

ensure_perl_build_installed() {
  if [ ! -f "$(perl_build_path)" ]; then
    download_perl_build
  fi
}

download_perl_build() {
  echo "Downloading perl-build..." >&2
  local plenv_url="https://github.com/tokuhirom/plenv.git"
  local perl_build_url="https://github.com/tokuhirom/Perl-Build.git"
  git clone $plenv_url "$(plenv_path)"
  git clone $perl_build_url "$(plenv_path)/plugins/perl-build/"
}

perl_build_path() {
  echo "$(plenv_path)/plugins/perl-build/bin/perl-build"
}

update_perl_build() {
  cd "$(plenv_path)" && git fetch && git reset --hard origin/master > /dev/null 2>&1
}

plenv_path() {
  echo "$(dirname $(dirname $0))/plenv"
}

plenv_update_timestamp_path() {
  echo "$(dirname $(dirname "$0"))/plenv_last_update"
}

plenv_should_update() {
  update_timeout=3600
  update_timestamp_path=$(plenv_update_timestamp_path)

  if [ ! -f "$update_timestamp_path" ]; then
    return 0
  fi

  last_update=$(cat "$update_timestamp_path")
  current_timestamp=$(date +%s)
  invalidated_at=$(($last_update + $update_timeout))

  [ $invalidated_at -lt $current_timestamp ]
}

install_or_update_perl_build() {
  if [ ! -f "$(perl_build_path)" ]; then
    download_perl_build
  elif plenv_should_update; then
    update_perl_build
    date +%s > "$(plenv_update_timestamp_path)"
  fi
}
