# nb untested

# Directory where dotfiles repository is cloned
DOTFILES_DIR=~/dotfiles

# List of files or directories to symlink. Path is relative to the dotfiles directory
FILES_TO_SYMLINK=(
  "alacritty/alacritty.toml"
)

# Creating symlinks
for file in "${FILES_TO_SYMLINK[@]}"; do
  # Source and target paths
  src="$DOTFILES_DIR/$file"
  target="$HOME/.config/${file}"

  # Making sure the target directory exists
  mkdir -p "$(dirname "$target")"

  # Creating the symlink, after removing the target file if it exists
  rm -f "$target"
  ln -s "$src" "$target"
  echo "Symlinked $src to $target"
done

echo "Setup completed!"
