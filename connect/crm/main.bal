import ballerina/http;

configurable int PORT = 7021;

configurable string REC_URL = "https://api.recomendations.com";
configurable string TOKEN_URL = "https://api.recomendations.com/token";
configurable string CLIENT_ID = "client_id";
configurable string CLIENT_SECRET = "client_secret";

service / on new http:Listener(PORT) {
    resource function get health() returns json {
        return {message: "CRM is up and running on " + PORT.toString()};
    }

    resource function get crm/recommonds() returns json|http:ClientError {

        http:Client httpEp = check new (url = REC_URL, config = {
            auth: {
                tokenUrl: TOKEN_URL,
                clientId: CLIENT_ID,
                clientSecret: CLIENT_SECRET
            }
        });
        json response = check httpEp->get("/recommend");
        return {response: response.toJsonString()};
    }
}

