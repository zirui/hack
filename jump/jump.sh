#!/bin/bash

# Author: zirui
# Description: a tools for login remote host
# Date: 2016-03-04


echo `date`

function show_help() {
    echo "
NAME: norm flow

DESCRIPTION

OPTIONS
    -s, --source:
           hospital alias (xiangya|pkuph|sysucc etc.)

    -t, --type:
        run mode type
            local: run local test
            spark: local spark mode
            cluster: cluster mode

    -l, --level:
            run level, xor bit for multiple steps
                1: extract(update dict & generate tagging data)
                2: strategy, default level
                4: keys
    -i, --input:
        local input file

    -c, --complete:
            run complete flow

    -f, --tables:
            table names to update, multiple tables seperated by comma

    -o, --output:
        local output file

Usage
    $(basename $0) [options] param

EXAMPLES
    $(basename $0) -s -pkuph -t cluster -l 3"
    exit 1
}

function check_options() {
    MASK=7;
    if [[ $(( LEVEL & $MASK )) -eq 0 ]]; then
        echo "err: invalid level $LEVEL"
        return 0
    fi
    return 1
}


FILENAME=`basename $0`
ARGS=`getopt -o "s:t:l:m:i:o:h:f:c" -l "source:,type:,level:,manager:,input:,output:,tables:,complete,help" -n ,"$FILENAME" -- "$@"`
if [[ $? != 0 ]]; then
    show_help;
    exit 1
fi
eval set -- "${ARGS}"
#echo "${@}"

#default parameters
SOURCE=common
TABLES='NULL'
LEVEL=2

while true; do
    case "${1}" in
        -h|--help)
            show_help; exit 0;;
        -s|--source)
            SOURCE=$2; shift 2;;
        -t|--type)
            RUN_TYPE=$2; shift 2;;
        -l|--level)
            LEVEL=$2; shift 2;;
        -i|--input)
            LOCAL_INPUT=$2; shift 2;;
        -o|--output)
            LOCAL_OUTPUT=$2; shift 2;;
        -m|--manager)
            MANAGER=$2; shift 2;;
        --tables)
            TABLES=$2; shift 2;;
        -c|--complete)
            COMPLETE_FLOW='True'; shift 1;;
        --)
            shift;
            break;;
    esac
done


echo "prams:
    source:$SOURCE, run_type:$run_type, level:$LEVEL tables:$TABLES"


if check_options;then
    echo "params error!!!";
    exit 1
fi


START_TIME=$(date +%s)


echo "ssh to $HOST as user_id:$USER"
ssh $USER@$HOST
