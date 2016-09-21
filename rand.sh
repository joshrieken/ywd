#!/bin/sh
##########################################################################
# Shellscript:	rand - return random number
# Author     :	Heiner Steven <heiner.steven@odn.de>
# Date       :	1995-09-02
# Requires   :	bc, od
# Category   :	Desktop
# SCCS-Id.   :	@(#) rand	1.9 04/02/18
##########################################################################
# Description
#    o	Prints a random number. Uses existing /dev/urandom for good
#	random numbers, otherwise date and time is used.
#    o	If /dev/urandom is available, arbitrary large random numbers
#	are supported.
#
# Notes
#    o	$Max should be used to find out, how many byte should be
#	read from /dev/urandom
#
# Changes
# 1995-09-28 stv	Random numbers cannot be maxvalue+1 (0.2)
# 2000-01-28 stv	numbers were too sequential (because of seconds) (1.2)
# 2001-12-07 stv	use $RANDOM variable, if present (1.3)
# 2002-07-01 stv	use /dev/urandom, if present (1.4)
# 2002-07-02 stv	fixed bug (numbers were always multiple of 256) (1.5)
# 2002-07-16 stv	random numbers were not evenly distributed (1.8)
##########################################################################

PN=`basename "$0"`			# program name
VER='1.9'

# Device returning random bytes. With Solaris 9 /dev/random may block,
# therefore we prefer the non-blocking /dev/urandom

RandomDevice=/dev/urandom
#MaxRand=4294967295			# 2^32 = 4 GB
# Some shell commands (e.g. Linux "expr") have problems with integer values
# greater than 2^31
MaxRand=32767

Usage () {
    echo >&2 "$PN - return random number, $VER (stv '95)
usage: $PN [maxvalue]

Prints a random value (1 <= random <= maxvalue) to standard output.
If no maximum value is specified, `echo \"$MaxRand + 1\" | bc` is the default"
    exit 1
}

Msg () {
    for i
    do echo "$PN: $i" >&2
    done
}

Fatal () { Msg "$@"; exit 1; }

joinlines () {
    # "bc" splits very long output lines using the following format:
    #	"a\
    #   b"

    tr -d '\134\012'	# remove backslash and trailing line-feed character
    echo		# terminate line using line-feed
}

while [ $# -gt 0 ]
do
    case "$1" in
	--)	shift; break;;
	-h)	Usage;;
	-*)	Usage;;
	*)	break;;			# First file name
    esac
    shift
done

if [ $# -gt 1 ]
then Usage
elif [ $# -eq 1 ]
then
    case "$1" in
    	*[!0-9]*)   Fatal "illegal number: $1";;
	*)	    Max=$1;;
    esac
fi
: ${Max:=$MaxRand}			# Use default value

# Try different ways of getting a random number

if [ -c $RandomDevice ]
then
    # Read 4 bytes from the random device (dd), and interpret them as a
    # 32 bit long unsigned integer (od -t u4).
    #n=`dd if=/dev/urandom bs=1 count=4 2>/dev/null |
    #	    od -t u4 | awk 'NR==1 {print $2}'`

    # Uncomment the following to use 64 bit random numbers
    #n=`dd if=/dev/urandom bs=1 count=8 2>/dev/null |
    #	    od -t u8 | awk 'NR==1 {print $2}'`

    # Uncomment the lines below to get a random number with $ndigit
    # digits.  Calculate the number of bytes needed as follows:
    # bytes= ... # round log256(10^$ndigit)
    #     -> log256(10^x) = x * log256(10) = x * ln(10)/ln(256)
    #        = x * .41524101186092029348
    # Example:
    #	How many bytes are needed to represent 10 decimal digits:
    #	10 * .41524101186092029348 = 4.1524101186092029348
    #	-> 5 bytes needed to represent all 10 digit decimal values
    #      from 0..9999999999
    #ndigit=10	# 0..9999999999
    #bytes=5
    ndigit=`expr "$Max" : '.*'`		# string length
    # The following calculation may return a result that is one to large
    # because we do not attempt to properly round the value to the next
    # largest integer value.
    bytes=`echo "$ndigit * l(10)/l(256) + 1" | bc -l | cut -d. -f1`
    hexdigits=`echo "$bytes * 2" | bc`
    #echo >&2 "DEBUG: ndigit=<$ndigit> bytes=<$bytes> hexdigits=<$hexdigits>"

    n=`(echo ibase=16; dd if=/dev/urandom bs=1 count=$bytes 2>/dev/null |
    	    od -tx1 |			# write as hex byte stream
	    sed -n '$q;p' |		# remove last line
	    cut -d ' ' -f2- |		# remove offsets
	    tr -d ' ' | joinlines |
	    cut -c1-$hexdigit |
	    tr '[a-f]' '[A-F]') |	# "bc" needs upper case hex chars
	    bc | joinlines`

elif [ -n "$RANDOM" ]
then
    # This shell has a built-in random function (ksh, bash, zsh), which
    # probably generates better distributed values than our "date"
    # approach.
    n=$RANDOM
else
    set -- `date '+%H %M %S'`
    [ $# -ne 3 ] && Fatal "could not invoke program date"

    n=`echo "$$ * $1 * $2 * $3 + $3" | bc`
fi

# Some "expr" commands have problems with large integer values
echo "$n % $Max + 1" | bc | joinlines
