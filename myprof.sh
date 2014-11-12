#!/usr/bin/env bash
# Initialize myprof

# Reload Library
alias reload='source ~/.bash_profile'

# Load colors first so they can be use in base theme
#source "${MYPROF}/themes/colors.theme.bash"
#source "${MYPROF}/themes/base.theme.bash"
#source "${MYPROF}/themes/minimal.theme.bash"

# library
LIB="${MYPROF}/lib/*.bash"
for config_file in $LIB
do
  source $config_file
done

# Load enabled aliases, completion, plugins
for file_type in "aliases" "completion" "plugins"
do
  _load_myprof_files $file_type
done

# Load custom aliases, completion, plugins
for file_type in "aliases" "completion" "plugins"
do
  if [ -e "${MYPROF}/${file_type}/custom.${file_type}.bash" ]
  then
    source "${MYPROF}/${file_type}/custom.${file_type}.bash"
  fi
done

# Custom
CUSTOM="${BASH_IT}/custom/*.bash"
for config_file in $CUSTOM
do
  if [ -e "${config_file}" ]; then
    source $config_file
  fi
done

unset config_file
if [[ $PROMPT ]]; then
    export PS1=$PROMPT
fi
