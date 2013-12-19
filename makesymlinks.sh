### Variables
dir=-/dotfiles
olddir=-/dotfiles_old
files="vimrc vim"

# create dotfiles_old
echo "Creating $olddir for backup of existing dotfiles"
mkdir -p $olddir
echo "done..."

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "done..."

# move existing dotfiles to dotfiles_old, then create symlinks
for file in $files; do
	echo "Moving any existing dotfiles from - to $olddir"
	mv -/.$file -/dotfiles_old
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file -/.$file
done
