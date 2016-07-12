#!/bin/bash
# Send email report about any stuck torrent in incomplete directory
# Usage: reportStuck.sh


# name of helper script that will be included
MAILUTILSSCRIPT="mailutils.sh"
# include the script
. "${BASH_SOURCE%/*}/$MAILUTILSSCRIPT"


# subject of email report
REPORTSUBJECT="List of Stucked torrents in 'incomplete' dir"

# text for email at the beginning
REPORTBODY="There are stuck torrents in 'incomplete' directory, manual interaction is required.\n"


# checking for mounting problems and the existence of rtcontrol util
if [ ! "$MAILHELPERMOUNTVAL" = true ] && [ -L "$RTCONTROLBIN" ]; then
    # prepare report and set optional subject and text for potentional email
    prepareReport rtlistStuck "$REPORTSUBJECT" "$REPORTBODY"
fi


# Send an email if necessary
checkForEmailSending


