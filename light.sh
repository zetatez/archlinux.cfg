
echo "# max brightness is:"
cat /sys/class/backlight/intel_backlight/max_brightness 

echo "# now set brightness to:"
echo "10000"  > /sys/class/backlight/intel_backlight/brightness
cat /sys/class/backlight/intel_backlight/brightness

