// assign pins we're using to global variables
led <- hardware.pin9;
btn <- hardware.pin1;

// track the current state of the LED in a global variable
state <- 0;

// configure LED and set initial state to OFF (0)
led.configure(DIGITAL_OUT, state);

// when the button is pressed & released, turn the LED off
btn.configure(DIGITAL_IN_PULLUP, function() {
    // software debounce
    imp.sleep(0.02);
    // read the state
    local btnState = btn.read();
    
    // 1 means the button was released
    if (btnState == 1) {
        // turn off the LED
        state = 0;
        led.write(state);
    }
});

// when we get a tweet message
agent.on("tweet", function(tweetData) {
    // turn the LED on
    state = 1;
    led.write(state);
});

