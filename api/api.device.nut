// Assign and configure pins we're using
led <- hardware.pin9;

// configure LED and set initial state to OFF (0)
led.configure(DIGITAL_OUT, 0);

agent.on("led", function(state) {
    led.write(state);
    server.log("Set LED to " + state);
});

