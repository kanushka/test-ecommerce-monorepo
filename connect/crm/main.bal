import ballerina/http;

configurable int PORT = 7021;
configurable string REC_URL = "";
configurable string TOKEN_URL = "";
configurable string CLIENT_ID = "";
configurable string CLIENT_SECRET = "";

service / on new http:Listener(PORT) {
    resource function get health() returns json {
        return {message: "CRM is up and running on " + PORT.toString()};
    }

    resource function get envs() returns json {
        return {
            environmentVariables: {
                port: PORT,
                url: REC_URL,
                tokenUrl: TOKEN_URL,
                clientId: CLIENT_ID,
                clientSecret: CLIENT_SECRET
            }
        };
    }

    resource function get recommonds() returns json {

        http:Client|http:ClientError httpEp = new (url = REC_URL, config = {
            auth: {
                tokenUrl: TOKEN_URL,
                clientId: CLIENT_ID,
                clientSecret: CLIENT_SECRET
            }
        });

        if (httpEp is http:Client) {
            json|http:ClientError response = httpEp->get("/recommend");
            if (response is json) {
                return {response: response.toJsonString()};
            } else {
                return {'error: true, message: "Error while calling /recommend endpoint in the http client"};
            }

        } else {
            return {
                'error: true,
                message: "Error while creating the http client",
                data: {
                    url: REC_URL,
                    tokenUrl: TOKEN_URL,
                    clientId: CLIENT_ID,
                    clientSecret: CLIENT_SECRET
                }
            };
        }
    }
}

