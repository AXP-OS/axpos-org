#!/bin/bash
###############################################################################
# device specs for creating a new page
#
# usage:
#       create_page.sh all
#       create_page.sh device_<XXXX>.params
#
###############################################################################

F_CHKFILES(){
    unset FLAVORFILES REQUIRED_FILES
    if [ "$HUGO_RELOCKABLE" == "yes" ];then
        for f in $(echo "${HUGO_FLAVORS,,}" |tr ',' ' ');do
            if [ -z "$FLAVORFILES" ];then
                FLAVORFILES="content/devices/fp_${HUGO_CODENAME}_${f}"
            else
                FLAVORFILES="$FLAVORFILES content/devices/fp_${HUGO_CODENAME}_${f}"
            fi
        done
    fi
    export REQUIRED_FILES="${FLAVORFILES} static/img/devices/${HUGO_CODENAME}_icon.png $HUGO_CI_GUIDE_PATH"
   
    for req in $REQUIRED_FILES; do
        if [ ! -f $req ];then
            echo "WARNING: missing $req"
        else
            echo "$req found"
        fi
    done
}

case $1 in
    all|device_*params);;
    help|*help) echo "Usage: either 'all' or a device_<XXXX>.params is required as an argument"; exit;;
    *)
    echo "ERROR: either 'all' or a device_<XXXX>.params is required"
    exit 4
    ;;
esac

if [ "$2" == "force" ];then
    echo "WARNING: using FORCE mode!! This will overwrite existing pages!"
    HARGS="--force"
fi

if [ "$1" == "all" ];then
    echo "Will create ALL pages"
    for dev in $(ls -1 device_*.params |grep -v INIT);do
        source device_INIT.params
        source $dev
        F_CHKFILES
        if [ -f "content/devices/${HUGO_VENDOR}/${HUGO_CODENAME}.md" ] && [ "$2" != "force" ];then
            echo ".. skipping $dev as it has been created already (and not forcing)"
            continue
        else
            hugo new --kind device content/devices/${HUGO_VENDOR}/${HUGO_CODENAME}.md $HARGS
        fi
    done
else
    if [ -f "$1" ];then
        source device_INIT.params
        source $1
        F_CHKFILES
        hugo new --kind device content/devices/${HUGO_VENDOR}/${HUGO_CODENAME}.md $HARGS
    else
        echo "ERROR: $1 not found"
        exit 4
    fi
fi
