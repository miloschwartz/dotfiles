fuzzy_cd() {
    local dir
    local cache_file="$HOME/.dir_cache"
    local git_root

    # Attempt to find the root of the git repository
    git_root=$(git rev-parse --show-toplevel 2>/dev/null)

    if [ -n "$git_root" ]; then
        # If in a git repo, start fuzzy finding from the git root, excluding hidden directories and node_modules
        dir=$(find "$git_root" -path '*/.*' -prune -o -path '*/node_modules/*' -prune -o -type d -print 2> /dev/null | fzf +m)
    else
        # Check if cache file exists
        if [ ! -f "$cache_file" ]; then
            echo "Directory cache not found. Please wait while caching..."
            # Call caching script here if cache doesn't exist
            ~/.dotfiles/cache_dirs.sh
        fi

        # Use fzf to select a directory from the cache
        dir=$(cat "$cache_file" | fzf +m)
    fi

    # Change directory to the selected one
    [ -n "$dir" ] && cd "$dir"
}
