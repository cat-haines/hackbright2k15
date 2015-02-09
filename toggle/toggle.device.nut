// assign pins we're using to global variables
led <- hardware.pin9;
btn <- hardware.pin1;

// track the current state of the LED in a global variable
state <- 0;

// configure LED and set initial state to OFF (0)
led.configure(DIGITAL_OUT, state);

btn.configure(DIGITAL_IN_PULLUP, function() {
    // software debounce
    imp.sleep(0.02);
    // read the state
    local btnState = btn.read();
    
    // 1 means the button was released
    if (btnState == 1) {
        // flip the state
        state = 1 - state;
        // log a message
        server.log("Set LED to: " + state);
        // write the new state to the led pin
        led.write(state);
    }
});

