# homebrew:begin
STRAP_HOMEBREW_PREFIX=''
command -v brew >/dev/null 2>&1 && STRAP_HOMEBREW_PREFIX="$(brew --prefix)"
if [ -n "$STRAP_HOMEBREW_PREFIX" ]; then
  # Add homebrew's sbin directory to the $PATH if it's not already there:
  if ! echo "$PATH" | tr ':' '\n' | grep -q "$STRAP_HOMEBREW_PREFIX/sbin"; then
    export PATH="$STRAP_HOMEBREW_PREFIX/sbin:$PATH"
  fi
  # Add homebrew's bin directory to the $PATH if it's not already there:
  if ! echo "$PATH" | tr ':' '\n' | grep -q "$STRAP_HOMEBREW_PREFIX/bin"; then
    export PATH="$STRAP_HOMEBREW_PREFIX/bin:$PATH"
  fi
fi
unset STRAP_HOMEBREW_PREFIX
# homebrew:end
