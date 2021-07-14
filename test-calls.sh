export ENDPOINT="xxxxxxxx"
export GCLOUD_APIGEE_TOKEN=$(gcloud auth print-access-token)
export APIKEY="xxxxxxxx"
export DEV_EMAIL="xxxxxxxx"
export SOAP_AUTH="xxxxxxxx"


## ---- SOAP-Apigee-DEMO-0 -----
#Passing one
curl -k --location --request POST 'https://bap-emea-apigee-5-dev.lalevee.org/soap/' \
--header 'Authorization: Basic $SOAP_AUTH' \
--header 'Content-Type: application/xml' \
--data-raw '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
    <Body>
        <say_hello xmlns="spyne.examples.hello.soap">
            <name>Nacho</name>
            <times>2</times>
        </say_hello>
    </Body>
</Envelope>'

## ---- SOAP-Apigee-DEMO-1 -----
# Failing one
curl -k --location --request POST 'https://$ENDPOINT/v1/soap/' \
--header 'Authorization: Basic $SOAP_AUTH' \
--header 'Content-Type: application/xml' \
--data-raw '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
    <Body>
        <say_hello xmlns="spyne.examples.hello.soap">
            <times>2</times>
        </say_hello>
    </Body>
</Envelope>'
# Failing one
curl -k --location --request POST 'https://$ENDPOINT/v1/soap/' \
--header 'Authorization: Basic $SOAP_AUTH' \
--header 'Content-Type: application/xml' \
--data-raw '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
    <Body>
        <say_hello xmlns="spyne.examples.hello.soap">
            <name>Nacho</name>
            <times>2</times>
        </say_hello>
    </Body>
</Envelope>'
#Passing one
curl -k --location --request POST 'https://$ENDPOINT/v1/soap/' \
--header 'Authorization: Basic $SOAP_AUTH' \
--header 'Content-Type: application/xml' \
--data-raw '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
    <Body>
        <say_hello xmlns="spyne.examples.hello.soap">
            <name>Nacho</name>
            <times>2</times>
        </say_hello>
    </Body>
</Envelope>'

## --- SOAP Apigee DEMO 2 ---
curl -kl --location --request GET 'https://bap-emea-apigee-5-dev.lalevee.org/v2/soap/hello?name=Nacho&times=23' \
--header 'x-apikey: $APIKEY'


# Create an API Product called SOAP-API-Product with SOAP-Apigee-DEMO-0, SOAP-Apigee-DEMO-1 and SOAP-Apigee-DEMO-2

# Create an App called SOAP-APP with SOAP-API-Product


#Create APP Key
curl --request POST \
  'https://apigee.googleapis.com/v1/organizations/bap-emea-apigee-5/developers/$DEV_EMAIL/apps/SOAP-APP/keys' \
  --header 'Authorization: Bearer $GCLOUD_APIGEE_TOKEN' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{"apiProducts":["SOAP-API-Product"],"consumerKey":"admin","consumerSecret":"admin","status":"approved"}' \
  --compressed

