if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi


# export PS1="\[\e[0;32m\][\t]\[\e[0;31m\]\u@\h\[\e[0;36m\]:\[\e[0;34m\]\W\[\e[0;37m\]$ \[\e[m\]"
export PS1="\[\e[0;31m\]\u@\h\[\e[0;36m\]:\[\e[0;34m\]\W\[\e[0;37m\]$ \[\e[m\]"
# export LC_TYPE="en_US.UTF-8"
# export LC_ALL=C
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LESSCHARSET=utf-8

export HOMEBREW_NO_AUTO_UPDATE=1

# polipo proxy  127.0.0.1:8123
#export http_proxy=54.250.245.82:13128
#export https_proxy=$http_proxy
#export ftp_proxy=$http_proxy
#export rsync_proxy=$http_proxy
#export all_proxy=$http_proxy
#export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

#-Djava.net.useSystemProxies=true
#-DsocksProxyHost=127.0.0.1
#http://memorynotfound.com/configure-http-proxy-settings-java/
#http://docs.oracle.com/javase/8/docs/technotes/guides/net/proxies.html
JAVA_HTTP_FLAGS='-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=8123 -Dhttp.nonProxyHosts="localhost|127.0.0.1"'

# export BC_ENV_ARGS=".bcrc"

# export ROOT_URL="http://`ifconfig en0 inet | tail -1 | cut -d ' ' -f2`:3000"
 
export MYSQL_PORT_3306_TCP_ADDR="127.0.0.1:3306"
export MYSQL_ENV_MYSQL_ROOT_PASSWORD="lmj"

# trace web browser https package
export SSLKEYLOGFILE="$HOME/.ssh/ssl/sslkey.log"

# python coverage use C_TRACER or "py"
# export COVERAGE_TEST_TRACER="c"

alias ls='ls -G'
alias ll='ls -Gl'
alias l='ls -G1'
alias lf='ls -Gf'
alias ping='ping -c 4'
alias grept='grep --binary-file=without-match'
alias mysql_server='sudo /usr/local/mysql/support-files/mysql.server'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
# alias jd-gui='/Applications/JD-GUI.app/Contents/MacOS/jd-gui'

export MAVEN_OPTS='-Xmx4096m -XX:MaxPermSize=256m'
# export GRADLE_OPTS='-Dorg.gradle.daemon=true'
export M2_REPO="$HOME/.m2/repository"

export HADOOP_PROTOC_PATH=/usr/local/bin/protoc

alias von="nohup obfsudp-darwin -c 123.50.24.92:28000 -l 127.0.0.1:1194 &"
alias voff="killall obfsudp-darwin"

alias ipyspark='PYSPARK_DRIVER_PYTHON=ipython pyspark'
alias spark-notebook='PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS=notebook pyspark'
#alias google-chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome="open -a 'Google Chrome'"
alias showjson='python -m json.tool'

