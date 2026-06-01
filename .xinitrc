while xsetroot -name "`date +%r``printf %70s``cat /sys/class/power_supply/BAT0/capacity`% "
do
	sleep 1
done &
exec dwm
