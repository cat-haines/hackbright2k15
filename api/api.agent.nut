i// when an HTTP requests comes into our agent:
http.onrequest(function(req, resp) {
    // always wrap in try catch
    try {
        if ("led" in req.query) {
            // convert query parameter to an integer
            // (This will throw and err if it's not an integer)
            local state = req.query.led.tointeger();
            // if state is 1 or 0, send a message to our device
            if (state == 1 || state == 0) {
                device.send("led", state);
            } 
        }
        
        // 200 OK is a pretty standard response
        resp.send(200, "OK");
    } catch(ex) {
        // if we hit an error, send a 500 response with the error
        resp.send(500, "Internal Agent Error - " + ex);
    }
});

server.log("Turn LED on: " + http.agenturl() + "?led=1");
server.log("Turn LED off: " + http.agenturl() + "?led=0");

