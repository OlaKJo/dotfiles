#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export TERM=rxvt-unicode
# added by Anaconda2 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/ola/installs/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/ola/installs/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/home/ola/installs/anaconda2/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/ola/installs/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

#-------------------------------------------------------------------------------------------
# Ola's functions
#-------------------------------------------------------------------------------------------

brightnessControll() {
	sudo chown ola /sys/class/backlight/intel_backlight/brightness
	sudo chown ola /sys/class/backlight/intel_backlight/max_brightness
}

t() {
	# increase the brightness of the screen
	file="/sys/class/backlight/intel_backlight/brightness"
	max_file="/sys/class/backlight/intel_backlight/max_brightness"

	val=$(cat "$file")
	
	maxVal=$(cat "$max_file")

	if [ $val -lt $maxVal ];
	then
		let "val=val+100"
	fi
	
	if [ $val -ge $maxVal ];
	then
		let "val=maxVal"
		echo "max brightness"
	fi
	echo $val > $file
}

s() {
	file="/sys/class/backlight/intel_backlight/brightness"
	max_file="/sys/class/backlight/intel_backlight/max_brightness"
	maxVal=$(cat "$max_file")
	if [ $1!="" ]; 
	then
		echo $1 > $file
		echo "Brightness set to $1"
	else
		echo "Please enter a value between 0 and $maxVal"
	fi
}

r() {
	# decrease the brightness of the screen
	file="/sys/class/backlight/intel_backlight/brightness"

	val=$(cat "$file")

	if [ $val -gt 0 ];
	then
		let "val=val-100"
	fi
	if [ $val -lt 0 ];
	then
		let "val=0"
	fi
	echo $val > $file
}
