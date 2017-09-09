if [ "${BASH-no}" != "no" ]; then
    [ -r ~/.bashrc ] && . ~/.bashrc
fi

source ~/.git-completion.bash

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home"
PATH="$JAVA_HOME/bin:$PATH"
export GROOVY_HOME="/usr/local/opt/groovy/libexec"
PATH="$GROOVY_HOME/bin:$PATH"

# export DERBY_HOME="$JAVA_HOME/db"
# PATH="$DERBY_HOME/bin:$PATH"

export ANT_HOME="/usr/local/opt/ant/libexec"

export JMETER_HOME="/usr/local/opt/jmeter/libexec"
export PATH="$JMETER_HOME/bin:$PATH"

export NODE_HOME="/usr/local/opt/node"
export NPM_HOME="$NODE_HOME/libexec/npm"

export ANDROID_HOME="/Library/Android/sdk"
export ANDROID_NDK_HOME="/Library/Android/sdk/ndk-bundle"
PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/25.0.3:$PATH"
PATH="$ANDROID_NDK_HOME:$PATH"

#default GRADLE_USER_HOME="$HOME/.gradle"
export GRADLE_HOME="$HOME/.gradle/wrapper/dists/gradle-latest"
PATH="$GRADLE_HOME/bin:$PATH"

export SCALA_HOME="/usr/local/opt/scala/libexec"
PATH="$PATH:$SCALA_HOME/bin"

export MYSQL_HOME="/usr/local/opt/mysql"
PATH="$MYSQL_HOME/bin:$PATH"

# user's
PATH="$PATH:$HOME/bin"

export GOPATH="$HOME/.go"
export GOBIN="$HOME/.go/bin"
# this is bad #export GOROOT="$(brew --prefix golang)/libexec"
export GOROOT="/usr/local/opt/go/libexec"
PATH="$PATH:$GOROOT/bin:$GOBIN"

PATH="$PATH:$HOME/.cargo/bin"

PATH="$PATH:$HOME/.composer/vendor/bin"

# final export PATH
export PATH


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by Anaconda3 4.2.0 installer
export PATH="$HOME/anaconda/bin:$PATH"


# MacPorts Installer addition on 2016-11-29_at_19:18:19: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

#export SPARK_HOME="/usr/local/spark"
export SPARK_HOME="/usr/local/opt/apache-spark/libexec"
export PATH="$PATH:$SPARK_HOME/bin"

export HADOOP_HOME="/usr/local/opt/hadoop/libexec"
export PATH="$PATH:$HADOOP_HOME/bin"

export MAGICK_HOME="/usr/local/opt/imagemagick"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$MAGICK_HOME/lib/"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.bash.inc' ]; then source '/usr/local/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.bash.inc' ]; then source '/usr/local/google-cloud-sdk/completion.bash.inc'; fi


export JETTY_HOME="/usr/local/opt/jetty/libexec"
export CATALINA_HOME="/usr/local/opt/tomcat/libexec"
