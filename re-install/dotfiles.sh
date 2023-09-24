# #!/bin/bash
#
# git clone git@github.com:Lhoosp/dotfiles.git $HOME/dotfiles
#
# # settings
# cp -R ~/dotfiles/.config $HOME
# cp ~/dotfiles/.gitconfig $HOME
# cp ~/dotfiles/.gitignore $HOME


#!/bin/bash

git clone git@github.com:Lhoosp/dotfiles.git $HOME/dotfiles

# Проверка успешности выполнения клонирования репозитория
if [ $? -ne 0 ]; then
  echo "Ошибка при клонировании репозитория. Процесс прерывается."
  exit 1
fi

# Настройки
cp -R ~/dotfiles/.config $HOME

# Проверка успешности копирования папки .config
if [ $? -ne 0 ]; then
  echo "Ошибка при копировании папки .config. Процесс прерывается."
  exit 1
fi

cp ~/dotfiles/.gitconfig $HOME

# Проверка успешности копирования файла .gitconfig
if [ $? -ne 0 ]; then
  echo "Ошибка при копировании файла .gitconfig. Процесс прерывается."
  exit 1
fi

cp ~/dotfiles/.gitignore $HOME

# Проверка успешности копирования файла .gitignore
if [ $? -ne 0 ]; then
  echo "Ошибка при копировании файла .gitignore. Процесс прерывается."
  exit 1
fi
