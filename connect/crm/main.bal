import ballerina/http;

configurable int PORT = 7021;

service / on new http:Listener(PORT) {
    resource function get health() returns json {
        return {status: http:OK.toString(), body: "CRM is up and running on " + PORT.toString()};
    }
}

