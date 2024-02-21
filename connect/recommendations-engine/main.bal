import ballerina/http;

configurable int PORT = 7022;

service / on new http:Listener(PORT) {
    resource function get health() returns json {
        return {status: http:OK.toString(), body: "Recommendation engine is up and running on " + PORT.toString()};
    }
}

