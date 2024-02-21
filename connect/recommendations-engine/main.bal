import ballerina/http;

configurable int PORT = 7022;

service / on new http:Listener(PORT) {
    resource function get health() returns json {
        return {message: "Recommendation engine is up and running on " + PORT.toString()};
    }

    resource function get recommend() returns json {
        json response = {
            "recommendation": "You should buy a new phone"
        };
        return response;
    }
}

