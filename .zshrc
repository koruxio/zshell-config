# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

alias x='startx'
alias f='xrandr --output eDP --brightness 0.8'
alias m='xrandr --output eDP --brightness 0.5'
alias n='xrandr --output eDP --brightness 0.3'
alias d='xrandr --output eDP --brightness 0.2'
alias c='mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'
alias vim='nvim'


push() {  
   echo "commit message: " 
   read msg    
   git status
   git add -A
   git commit -m "$msg"
   git push
}

lock() {
	i3lock -c 0D0E0D
}

logoff() {
	pkill -KILL -u $USER
}

dict() {
    echo "Defintion for $1"

    RESULT=$(curl -s https://api.dictionaryapi.dev/api/v2/entries/en/$1 | python3 -mjson.tool | grep definition | sed 's/"//g;s/definition//g;s/://g;s/s//g;s/\[//g')
    SOUND=$(curl -s https://api.dictionaryapi.dev/api/v2/entries/en/$1 | python3 -mjson.tool | grep audio | head -4 | tail -1 | awk '{print $2}' | sed 's/"//g;s/,//g')

    echo $RESULT
    mpv $SOUND --really-quiet

}

##Qts
#======

quotespool() {
WEBSRC='https://www.passiton.com/inspirational-quotes'
page=`shuf -i 1-50 -n 1`
quote=`curl -s $WEBSRC?page=$page | grep "<img alt=" | tr -s ">" | cut -f2 -d ">" | cut -f1 -d "#" | cut -f2 -d '"' | grep -v "&" | shuf -n 1`
echo "Hey $USER :)
"
echo "$quote"
}

pyenv() {
	echo "Enter environment name : \n"
	read envname

	echo "Enter python version\neg: 3.9"
	read pyversion

	mkdir $HOME/$envname
	cd $HOME/$envname


	conda create -n $envname python=$pyversion
	echo "Succesfully created environment $envname\n"
	echo "Installing default packages ->"
	
	pip install pandas matplotlib jupyter numpy scikit-learn scipy

	echo "Succesfully installed neccessary packages\n"

	cd $HOME/$envname
	
	jupyter-notebook
}



###Lofi play
#============

lofi() {
echo -e "\e[2;96m"
quotespool
echo -e "\n"
echo " Playing lofi... relax and chill... :)
"
mpv --really-quiet --no-video https://www.youtube.com/watch?v=5qap5aO4i9A &
sleep 5
bash .shellrain
}

export PATH="$PATH:~/.local/bin"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
# source ~/miniconda3/bin/activate  # commented out by conda initialize

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sarosx/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sarosx/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sarosx/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sarosx/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

