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
  local perl_build_url="https://github.com/tokuhirom/Perl-Build.git"
  git clone --depth 1 $perl_build_url "$(perl_build_checkout)"
}

perl_build_checkout() {
  echo "$(dirname $(dirname $0))/perl-build"
}

perl_build_path() {
  echo "$(perl_build_checkout)/bin/perl-build"
}

update_perl_build() {
  cd "$(perl_build_checkout)" && git fetch && git reset --hard origin/master > /dev/null 2>&1
}

update_timestamp_path() {
  echo "$(perl_build_checkout)/.git/FETCH_HEAD"
}

should_update() {
  local update_timeout=3600
  local update_timestamp_path=$(update_timestamp_path)

  if [ ! -f "$update_timestamp_path" ]; then
    return 0
  fi

  local last_update="$(date -r "$update_timestamp_path" +%s)"
  local current_timestamp="$(date +%s)"
  local invalidated_at="$(($last_update + $update_timeout))"

  [ $invalidated_at -lt $current_timestamp ]
}

install_or_update_perl_build() {
  if [ ! -f "$(perl_build_path)" ]; then
    download_perl_build
  elif should_update; then
    update_perl_build
  fi
}
