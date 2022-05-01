#!/bin/sh
set -e

echo " ------------ Set Password ------------"
# パスワードを記憶
read -sp "このMacにログインした際のパスワードを入力してください: " __pass;
echo "\n ------------ END ------------"

echo " ------------ Homebrew ------------"
read -p "Homebrewをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y) 

    echo "Start Install Homebrew..."

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "Install Homebrew is Complete!" ;;

  n|N)
    echo "インストールをスキップしました" ;;

esac
echo " ------------ END ------------"

echo " ------------ zsh ------------"
read -p "ログインシェルをzshに変更しますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    echo "=================="
    echo "現在のzshのPATH: $(which zsh)"
    echo "=================="

    echo "=================="
    echo "現在のzshのバージョン: $(/bin/zsh --version)"
    echo "=================="

    echo "=================="
    echo "Homebrewでインストールできるzshのバージョン: $(brew info zsh)"
    echo "=================="

    read -p "このままzshをインストールしていいですか？ (y/n)" Answer < /dev/tty
    case ${Answer} in
      y|Y)
        brew install zsh zsh-syntax-highlighting
        echo ${__pass} | sudo -S -- sh -c 'echo '/usr/local/bin/zsh' >> /etc/shells'
        chsh -s /usr/local/bin/zsh
        ;;

      n|N)
        echo "インストールをスキップしました" ;;
    esac

    echo "=================="
    echo "現在のzshのPATH: $(which zsh)"
    echo "=================="

    echo "=================="
    echo "現在のzshのバージョン: $(/usr/local/bin/zsh --version)"
    echo "=================="

    echo "=================="
    echo "現在のログインシェル: $(echo $SHELL)"
    echo "=================="

    FILE="${HOME}/.bash_profile"

    if [[ -e ${FILE} ]]; then
      source ${FILE} >> ~/.zshrc
    elif [[ ! -e ${FILE} ]]; then
      touch ${FILE}
    fi

    source ~/.zshrc

    echo "zshをインストールしました。一度プロセスを終了します。"

    exec $SHELL -l #ログインシェルの再読み込み

    ;;

  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ ITerm2 ------------"
read -p "ITerm2をインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y) brew cask install iterm2 ;;

  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ node ------------"
read -p "node(nvm)をインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y) brew install nvm
       echo "インストールが完了しました" ;;
  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ vscode ------------"
read -p "vscodeをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y) brew install --cask visual-stadio-code
       echo "インストールが完了しました" ;;
  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ docker ------------"
read -p "dockerをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y) brew install --cask docker
       echo "インストールが完了しました" ;;
  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ chrome ------------"
read -p "chromeをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y) brew install --cask google-chrome
       echo "インストールが完了しました" ;;
  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ git ------------"
read -p "gitをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y) brew install git
       echo "インストールが完了しました" ;;
  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ curl ------------"
read -p "curlをインストールしますか？ (y/n)" answer < /dev/tty
case ${answer} in
  y|y) brew install curl
       echo "インストールが完了しました" ;;
  n|n)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ end ------------"

echo " ------------ ohMyZsh ------------"
read -p "ohMyZshをインストールしますか？ (y/n)" answer < /dev/tty
case ${answer} in
  y|y) sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
       echo "インストールが完了しました" ;;
  n|n)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ end ------------"
