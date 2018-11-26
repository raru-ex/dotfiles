#!/bin/sh
# vim
ln -nfs ~/dotfiles/.vimrc ~/.vimrc
ln -nfs ~/dotfiles/.vim ~/.vim
# nvim
ln -nfs ~/dotfiles/.vim ~/.config/nvim
ln -nfs ~/dotfiles/.vimrc ~/.config/nvim/init.vim

# ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -nfs ~/dotfiles/.ctags ~/.ctags

# set up ensime
if [ -e ~/.sbt/1.0/plugins ]; then
  mkdir -p ~/.sbt/1.0/plugins/
fi

grep sbt-ensime ~/.sbt/1.0/plugins/plugins.sbt > /dev/null
if [ $? -eq 1 ]; then
  echo 'addSbtPlugin("org.ensime" % "sbt-ensime" % "2.5.1")' >> ~/.sbt/1.0/plugins/plugins.sbt
fi
grep ensime ~/.sbt/1.0/global.sbt > /dev/null
if [ $? -eq 1 ]; then
  echo 'ensimeIgnoreMissingDirectories := true' >> ~/.sbt/1.0/global.sbt
  echo 'ensimeIgnoreSourcesInBase := true' >> ~/.sbt/1.0/global.sbt
else
  echo 'ensimeIgnoreMissingDirectories := true' > ~/.sbt/1.0/global.sbt
  echo 'ensimeIgnoreSourcesInBase := true' >> ~/.sbt/1.0/global.sbt
fi
