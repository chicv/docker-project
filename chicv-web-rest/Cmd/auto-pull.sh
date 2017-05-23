#!/usr/bin/env bash
RESRDIR="/home/chicv/Code/rest"
ADMINDIR="/home/chicv/Code/admin"

pwd=`pwd`
updateDir(){
        cd $1
        result=`git pull`
        list=${result}
        for op in $list
          do
            if [ -f $op ] && [ "${op##*.}" = "sql" ]; then
               echo $op 
               cat  $op && mysql -f < $op
            fi
        done
}

updateDir $RESRDIR;
updateDir $ADMINDIR;
cd $pwd
