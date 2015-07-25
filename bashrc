

export CLICOLOR=1

export LSCOLORS=GxFxCxDxBxegedabagaced


stty columns 1000
#PS1='\[\e[0;32m\u@\w/:[\e[m'


#env setting
PYPY_HOME='/usr/local/pypy-2.4.0-osx64'
export PATH=$PATH:$PYPY_HOME/bin
export SPARK_HOME=/usr/local/spark-1.2.1-bin-hadoop2.4
export PATH=$PATH:$SPARK_HOME/bin
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin
export GOPATH=/usr/local/go
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/apple/app/anaconda/lib/python2.7/site-packages/zmq
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/apple/app/anaconda/lib
#p=$(launchctl getenv PATH)
#launchctl setenv PATH /my/new/path:$p




#user defined alias
alias ll='ls -hltr'

#server
alias zsh='ssh -t ziruizhang@osys11.meilishuo.com ssh'
alias dm02='zsh work@dm02'
alias jxq='zsh work@jxq-spark-002'
alias jxq1='zsh ziruizhang@jxq-bi-dev01'
alias jxq2='zsh ziruizhang@jxq-bi-dev02'
alias jxq_test3='zsh ziruizhang@jxq-bi-test03'
alias um='zsh um@jxq-bi-test02'

alias dm03='zsh work@dm03'
alias dev='zsh ziruizhang@dm02'
alias nxlog='zsh -t work@dm02 ssh work@nxlog'


#utils
alias ps?='ps aux | grep'
alias 2c='cd ~/code'
alias 2d='cd ~/Downloads'
alias 2git='cd ~/code/github'
alias 2dr='cd ~/code/github/yidu/data_wrangling'
alias 2download='cd ~/Downloads'
alias 2dr='cd /Users/apple/code/github/yidu/data_wrangling'
alias grep='grep --color'

alias dev0='cd ~/code/utils; ./dev0.sh'
alias bj2='cd ~/code/utils; ./bj2.sh'
alias bj='cd ~/code/utils; bash bj.sh'
alias upload='bash ~/code/utils/upload.sh'
alias download='bash ~/code/utils/download.sh'
alias flush_dns='bash ~/code/github/hack/flush_dns.sh'


#alias download='cd ~/coding/github_zirui/utils;bash download.sh'
#alias download='bash /Users/apple/code/github/utils/download.sh'
#alias upload='bash /Users/apple/code/github/utils/upload.sh'
alias goagent='python ~/app/goagent-3.0/local/proxy.py'

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin





