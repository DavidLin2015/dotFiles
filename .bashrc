########################################
# CLEAN UP ALIASES AND FUNCTIONS
########################################

unalias -a
unset -f `declare -F | awk '{print $3}'`

# Source alias and env variables
source ~/.bashrc_alias
source ~/.bashrc_env

########################################
# FZF STUFF
########################################

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

########################################
# CUSTOM TERMINAL SETTINGS
########################################

export PS1="\[\e[32m\][\[\e[m\]\[\e[34m\]\h\[\e[m\]\[\e[37m\]:\[\e[m\] \w \[\e[32m\]]\[\e[m\] "

# prompt with time
#export PS1="\[\e[32m\][\[\e[m\]\[\e[34m\]\h\[\e[m\]\[\e[37m\]:\[\e[m\]\[\e[35m\]\A\[\e[m\] \w \[\e[32m\]]\[\e[m\] "

alias ll="ls -alh"
alias l="ls --color"
alias ls="ls --color"
alias ..="cd .."
alias clr="clear"
alias h="history"
alias g="grep"
alias hg="history | grep"
alias d="dirs -v"
alias psnum="ps ux | grep davilin | awk '{count ++} END {print count}'"
alias runvalgrind="valgrind --leak-check=full --log-file=valgrind_mem_check.log --track-fds=yes --read-var-info=yes -v --trace-children=yes"
alias cdlatest="cd \$(latestfile)"
alias cdoldest="cd \$(oldestfile)"

alias sj=". ~/script/job_sel.sh"

alias resource="source ~/.bashrc"

alias killjobs="jobs -l > /tmp/.jobs.txt && awk '{print \$2\" \"\$3}' /tmp/.jobs.txt | xargs kill -9 &> /dev/null ; rm /tmp/.jobs.txt &> /dev/null"
alias killps="ps ux | grep -v 'sshd\|tcsh' | awk '{print \$2;}' | xargs kill -9"

########################################
# CUSTOM FUNCTIONS
########################################

function rcase { make TEST_CASES=../$1 DIFFPRG=/home/davilin/bin/vimdiff; }
function snvdev { export NVDEV=$1; }
function chdev { cd `~/script/chdev.sh $1`; . ~/script/setdev.sh $1; }
function review { /home/nv/utils/p4review/p4review.pl -diff vimdiff /home/p4review/cl-$1.p4r; }
function findfile { find . -type f -iname $1 -print; }
function pud { pushd +$1 >& /dev/null; dirs -v; }
function pod { popd  +$1 >& /dev/null; dirs -v; }
function lsfcsh { qsub -P vlsi_meth_vlsi_dft -q dft_regress_$1 -m rel4or5 -Is csh; }
function lsfcsh6 { qsub -P vlsi_meth_vlsi_dft -q dft_regress_$1 -m rel68 -Is csh; }
function killvnc { vncserver -kill :$1; }

function latestfile { echo $(stat -c "%Y %n" * | sort -nr | head -1 | cut -d " " -f 2-); }
function oldestfile { echo $(stat -c "%Y %n" * | sort -n  | head -1 | cut -d " " -f 2-); }

function makesim { cd $NVDEV/nvtools/cad/cadlib/simulator; p4 sync ...; cd tn_shell_sync; makepkg; }

function jkill { kill -9 %$1; }

function setenv { export $1=$2; }

# Auto cd .. for submodule
function makecdpkg {
    if [ ! -f Makefile ]; then
        cd ..
    fi
    make -j 8 NO_PERFORCE=1 install USE_CLANG=1
}
function makecddbg {
    if [ ! -f Makefile ]; then
        cd ..
    fi
    make -j 8 install NO_PERFORCE=1 STRIP= NO_OPT=1 USE_CCACHE=1 USE_CLANG=1
}
function makecdprl {
    if [ ! -f Makefile ]; then
        cd ..
    fi
    make -j 8 NO_PERFORCE=1 BUILD_LANG=perl install USE_CCACHE=1 USE_CLANG=1
}
function makecdprldbg {
    if [ ! -f Makefile ]; then
        cd ..
    fi
    make -j 8 install NO_PERFORCE=1 BUILD_LANG=perl STRIP= NO_OPT=1 USE_CCACHE=1 USE_CLANG=1
}

########################################
# CUSTOM AUTO COMPLETE
########################################

#shopt -s direxpand

_p4()
{
    compopt -o default
    local cur prev cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    cmds="add branch branches change changes client clients counter counters \
        delete depot depots describe diff diff2 edit filelog files fix fixes \
        fstat group groups have help info integrate integrated job jobs jobspec \
        label labels labelsync lock obliterate opened passwd print protect \
        rename reopen resolve resolved revert review reviews set submit sync \
        triggers unlock user users verify where shelve unshelve"

        if   [[ ${prev} == -*c* ]]; then
            COMPREPLY=( $(compgen -W "$(p4 opened |& awk \{print\ \$4,\$5\} | sort -u | /home/utils/grep-2.18/bin/grep -o "default\|[0-9]*")" -- ${cur}) )
        elif [[ ${prev} == change ]]; then
            COMPREPLY=( $(compgen -W "$(p4 opened |& awk \{print\ \$4,\$5\} | sort -u | /home/utils/grep-2.18/bin/grep -o "[0-9]*")" -- ${cur}) )
        elif [[ ${COMP_CWORD} == 1 ]]; then
            COMPREPLY=( $(compgen -W "${cmds}" -- ${cur}) )
        fi
}

_editp4()
{
    compopt -o default
    local prev
    COMPREPLY=()
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    if   [[ ${prev} == -*c* ]]; then
        COMPREPLY=( $(compgen -W "$(p4 opened |& awk \{print\ \$4,\$5\} | sort -u | /home/utils/grep-2.18/bin/grep -o "default\|[0-9]*")" -- ${cur}) )
    fi
}

_make()
{
    compopt -o default
    local cur prev cmds cmds2
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    if [[ ${COMP_CWORD} -gt 1 ]]; then
        prev2="${COMP_WORDS[COMP_CWORD-2]}"
    else
        prev2=""
    fi
    cmds="SwarmReview SwarmReviewUpdate Review JETSubmit VirtualSubmit JETReview CppCheck CppCheckP4 CppCheckHtml JETUnitTestClean JETUnitTestCompile JETUnitTestRun"
    cmds2="CppCheck CppCheckHtml"

    if [[ ${COMP_CWORD} == 1 ]]; then
        #COMPREPLY=( $(compgen -W "${cmds}" -- ${cur}) )
        _comp "${cmds}"
    elif [[ " ${cmds} "  =~ .*\ ${prev}\ .* ]]; then
        compopt -o nospace
        COMPREPLY=( CL= )
    elif [[ ${prev} == "CL" && ${cur} == "=" ]]; then
        COMPREPLY=( $(compgen -W "$(p4 opened |& awk \{print\ \$4,\$5\} | sort -u | /home/utils/grep-2.18/bin/grep -o "[0-9]*")") )
    elif [[ ${prev2} == "CL" && ${prev} == "=" ]]; then
        COMPREPLY=( $(compgen -W "$(p4 opened |& awk \{print\ \$4,\$5\} | sort -u | /home/utils/grep-2.18/bin/grep -o "[0-9]*")" -- ${cur}) )
    fi
}

complete -F _p4 p4
complete -F _editp4 editp4
complete -F _make make

_comp() {
    local compArray=($1)
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(printf %s\\n "${compArray[@]}" |
    awk -v IGNORECASE=1 -v p="$cur" \
        'p==substr($0,0,length(p))'))
}

