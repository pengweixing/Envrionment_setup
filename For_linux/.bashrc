# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
TEMP=/disk1/pengweixing/tmp
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
export PAGER=less
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="/disk1/sebastianpersson/Nanopore/software/ont-guppy/bin:$PATH"
export PASH="export PATH=/disk1/pengweixing/software/sratoolkit.2.11.1-ubuntu64/bin:$PATH"
export PATH=/disk1/01.soft/sratoolkit.2.9.6-1-ubuntu64/bin:$PATH

export MOSEKPLATFORM=linux64x86
export PATH=$PATH:/disk1/pengweixing/software//mosek/8/tools/platform/$MOSEKPLATFORM/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/disk1/pengweixing/software//mosek/8/tools/platform/$MOSEKPLATFORM/bin
export MOSEKLM_LICENSE_FILE=/disk1/pengweixing/software/mosek/8/licenses
export AA_DATA_REPO=/disk1/pengweixing/software/AmpliconArchitect/data_repo
alias ll="ls -hltr"
alias l="ls -hltr"
export CLICOLOR=1
alias l="ll -hltr"
alias les="less -S"
alias lless="less -S"
alias xpw="cd /disk1/pengweixing"
PS1="\[\e[1;33m\][\u@\h:\[\e[1;34m\] \t \[\e[32m\]\w]\n\[\e[33m\]$\[\e[m\]"
export HISTIGNORE='pwd:ls:ls -ltr:cd:ll:history:'

alias grep='grep --color=auto'
export PATH=/disk1/pengweixing/software/gatk-4.1.7.0:$PATH
###for cnvnator####
export ROOTSYS=/disk1/pengweixing/software/cnvnator/root
export PATH=$ROOTSYS/bin:$PATH
export PATH=/disk1/pengweixing/software/htslib-1.10.2/bin:$PATH
export PATH=/disk1/pengweixing/software/hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/:$PATH
export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
export PERL5LIB=/disk1/pengweixing/software/vcftools/src/perl:$PERL5LIB
export PATH=/disk1/pengweixing/software/seqtk:/disk1/pengweixing/software/tabtk:$PATH
export PATH=/disk1/pengweixing/software/DFilter1.6:$PATH
export PATH=/disk1/pengweixing/software/R-4.1.1/bin/:$PATH
####################
alias rackham='ssh pengwei@rackham.uppmax.uu.se'
alias uppmax2='ssh -A pengwei-sens2018102@bianca.uppmax.uu.se'
alias glio_uppmax='ssh -A pengwei-sens2019574@bianca.uppmax.uu.se'
alias lene_uppmax='ssh -A pengwei-sens2021582@bianca.uppmax.uu.se'
alias lene_ftp='sftp -q pengwei-sens2021582@bianca-sftp.uppmax.uu.se'
alias glio_uppftp='sftp -q pengwei-sens2019574@bianca-sftp.uppmax.uu.se'
alias uppftp2='sftp -q pengwei-sens2018102@bianca-sftp.uppmax.uu.se'
alias sh='/bin/bash'
alias bw="sh /disk1/pengweixing/project_archive/old_scripts/bw.sh"
alias tss="sh /disk1/pengweixing/project_archive/old_scripts/tss.sh"
alias cromwell="java -jar /disk1/pengweixing/pipeline/GATK_wdl_pipeline/cromwell-78.jar"
alias womtool="java -jar /disk1/pengweixing/pipeline/GATK_wdl_pipeline/womtool-78.jar"
alias rc="python /disk1/pengweixing/project_archive/old_scripts/reversecomplement.py"
alias ccat="cat"

export PATH="/disk1/pengweixing/software/homer/bin:/disk1/pengweixing/software/sambamba:$PATH"
export PATH="/disk1/pengweixing/software/cufflinks-2.2.1.Linux_x86_64:$PATH"
export PATH="/disk1/pengweixing/software/sambamba:$PATH"
export PATH="/disk1/pengweixing/software/Nextflow:$PATH"
export PATH=/disk1/pengweixing/software/bedtk:$PATH
export CV_SRC=/disk1/pengweixing/software/CycleVi
export LD_LIBRARY_PATH=/disk1/pengweixing/software/preseq/htslib/lib:$LD_LIBRARY_PATH
export PATH="/disk1/pengweixing/software/ncbi-blast-2.12.0+/bin:$PATH"
export PATH="/disk1/pengweixing/software/vcftools/bin:$PATH"
export PATH="/disk1/pengweixing/software/liquibase-4.9.1:$PATH"
export PATH="/disk1/pengweixing/software/vcftools/bin:$PATH"
export PATH="/disk1/pengweixing/software/bcftools2:$PATH"
export PERL5LIB=${PERL5LIB}:/disk1/pengweixing/software/BioPerl-1.6.924
export PATH="/disk1/pengweixing/software/Perl-5.2.6/bin:$PATH"
export PATH="/disk1/pengweixing/software/jdk-17.0.3/bin:$PATH"
export PATH="/disk1/pengweixing/software/ensembl-vep:$PATH"
export PATH="/disk1/pengweixing/software/Winnowmap/bin:$PATH"


# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/disk1/pengweixing/software/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/disk1/pengweixing/software/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/disk1/pengweixing/software/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/disk1/pengweixing/software/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

export PATH="/disk1/pengweixing/software/samtools-1.14/:$PATH"
export PATH="/disk1/pengweixing/software/jdk-17.0.3/bin:$PATH"
export PATH="/disk1/pengweixing/software/Bismark-0.24.0/:$PATH"
export PATH="/disk1/pengweixing/software/miniconda3/bin/:$PATH"

export AA_SRC=/disk1/pengweixing/software/AmpliconArchitect/src
export AC_SRC=/disk1/pengweixing/software/AmpliconClassifier
export PATH=/disk1/pengweixing/software/sambamba:$PATH
export PATH=/disk1/pengweixing/software/STAR-2.7.10b/source:$PATH
