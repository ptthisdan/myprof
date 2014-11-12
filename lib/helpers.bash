# Helper function loading various enable-able files
function _load_myprof_files() {
  subdirectory="$1"
  if [ ! -d "${MYPROF}/${subdirectory}/enabled" ]
  then
    continue
  fi
  FILES="${MYPROF}/${subdirectory}/enabled/*.bash"
  for config_file in $FILES
  do
    if [ -e "${config_file}" ]; then
      source $config_file
    fi
  done
}

# Function for reloading aliases
function reload_aliases() {
  _load_myprof_files "aliases"
}

# Function for reloading auto-completion
function reload_completion() {
  _load_myprof_files "completion"
}

# Function for reloading plugins
function reload_plugins() {
  _load_myprof_files "plugins"
}