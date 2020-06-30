#!/bin/sh

set -e

# Oh My ZSH
export ZSH=$HOME/.local/share/oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom
export KEEP_ZSHRC=yes

export RUNZSH=no

if [ ! -d $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  rm -f ~/.zshrc
fi

if [ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

if [ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
fi

# Oh My Tmux #d6f0f64
export OMTMUX=$HOME/.local/share/oh-my-tmux

if [ ! -d $OMTMUX ]; then
  mkdir -p $OMTMUX
  git clone https://github.com/gpakosz/.tmux.git $OMTMUX
else
  (cd $OMTMUX; git pull)
fi

ln -s -f $OMTMUX/.tmux.conf
