print_result()
{
    if [[ $1 -eq $2 ]]; then
        echo Done!
    else
        echo FAIL!
        exit 1face.preferred_buffer_transfo
    fi
}

# test gpio_mockup getter

echo 1 > /sys/kernel/debug/gpio-mockup/gpiochip0/10
print_result $(gpioget gpiochip0 10) 1

echo 0 > /sys/kernel/debug/gpio-mockup/gpiochip0/10
print_result $(gpioget gpiochip0 10) 0


# test gpio_mockup setter

gpioset --mode=time --sec=1 -b gpiochip0 10=1
print_result $(cat /sys/kernel/debug/gpio-mockup/gpiochip0/10) 1

sleep 1

print_result $(cat /sys/kernel/debug/gpio-mockup/gpiochip0/10) 0
