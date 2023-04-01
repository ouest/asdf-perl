echoerr() {
  printf "\033[0;31m%s\033[0m" "$1" >&2
}

ensure_perl_install_installed() {
  if [ ! -f "$(perl_install_bin)" ]; then
    download_perl_install
  fi
}

download_perl_install() {
  echo "Downloading perl-install..." >&2
  local perl_install_url="https://github.com/skaji/perl-install.git"
  git clone --depth 1 $perl_install_url "$(perl_install_checkout)"
}

perl_install_checkout() {
  echo "$(dirname "$(dirname "$0")")/perl-install"
  #echo "$(dirname $(dirname $0))/perl-install"
}

perl_install_bin() {
  echo "$(perl_install_checkout)/perl-install"
}

update_perl_install() {
  cd "$(perl_install_checkout)" && git fetch && git reset --hard origin/HEAD >/dev/null 2>&1
}

update_timestamp_path() {
  echo "$(perl_install_checkout)/.git/FETCH_HEAD"
}

should_update() {
  local update_timeout=3600
  local update_timestamp_path
  update_timestamp_path=$(update_timestamp_path)

  if [ ! -f "$update_timestamp_path" ]; then
    return 0
  fi

  local last_update
  last_update=$(date -r "$update_timestamp_path" +%s)
  local current_timestamp
  current_timestamp=$(date +%s)
  local invalidated_at="$((last_update + update_timeout))"

  [ "$invalidated_at" -lt "$current_timestamp" ]
}

install_or_update_perl_install() {
  if [ ! -f "$(perl_install_bin)" ]; then
    download_perl_install
  elif should_update; then
    update_perl_install
  fi
}
