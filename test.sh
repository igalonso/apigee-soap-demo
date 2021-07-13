export ENDPOINT="bap-emea-apigee-5-dev.lalevee.org"

# Failing one
curl --location --request POST 'https://$ENDPOINT/soap-test/' \
--header 'UserID: 1234' \
--header 'Content-Type: application/xml' \
--data-raw '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
    <Body>
        <say_hello xmlns="spyne.examples.hello.soap">
            <times>2</times>
        </say_hello>
    </Body>
</Envelope>'
#Passing one
curl --location --request POST 'https://$ENDPOINT/soap-test/' \
--header 'UserID: 1234' \
--header 'Content-Type: application/xml' \
--data-raw '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
    <Body>
        <say_hello xmlns="spyne.examples.hello.soap">
            <name>Nacho</name>
            <times>2</times>
        </say_hello>
    </Body>
</Envelope>'

