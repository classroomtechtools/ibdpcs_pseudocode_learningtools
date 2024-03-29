if [ ! -d ~/Documents/IB\ CS\ Learning\ Tools/ib_dp_course ]; then
    echo "Not installed or else directory moved!"
    exit 1
fi
cd ~/Documents/IB\ CS\ Learning\ Tools/

if screen -list | grep -q "IBCS"; then
    # already running a screen by that name
    echo "IBCS screen already present"
else
    echo "Creating screen by name IBCS"
    screen -mdS IBCS
fi

# Open if already running, or re-launch if not
OUTPUT=`pipenv run jupyter notebook list`
CHARNUM=`echo $OUTPUT | wc -c`
if [ $CHARNUM -gt "28" ]; then
    echo "Jupyter already running, opening"
    echo $OUTPUT | awk '/: .* ::/ {print $4}' | xargs open
else
    echo "Launching Jupyter"
    screen -S IBCS -p 0 -X stuff "cd ~/Documents/IB\ CS\ Learning\ Tools/
"
    screen -S IBCS -p 0 -X stuff "pipenv run jupyter notebook --notebook-dir=ib_dp_course
"
fi
