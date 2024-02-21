import ballerina/http;

service / on new http:Listener(0) {
    resource function get health() returns json {
        return {status: http:OK.toString(), body: "CRM is up and running\n"};
    }
}

