# SOAP journey to rest Apigee Demo

This demo explores the journey from SOAP to REST for a customer.

 First, shows as passthrough SOAP Proxy.


Next, adds verification of SOAP WSDL, verification of authentication and metrics


Finally creates a REST API from the SOAP WSDL.

## How to:
1) Deploy the k8s service
```bash
kubectl create -f service.yaml
```
2) Create a Target Server called SOAP-Service
3) Deploy these 3 proxies
4) Create an API Product called SOAP-API-Product with SOAP-Apigee-DEMO-0, SOAP-Apigee-DEMO-1 and SOAP-Apigee-DEMO-2
5) Create an App called SOAP-APP with SOAP-API-Product
6) Create APP Key
```bash
curl --request POST \
  'https://apigee.googleapis.com/v1/organizations/bap-emea-apigee-5/developers/$DEV_EMAIL/apps/SOAP-APP/keys' \
  --header 'Authorization: Bearer $GCLOUD_APIGEE_TOKEN' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{"apiProducts":["SOAP-API-Product"],"consumerKey":"admin","consumerSecret":"admin","status":"approved"}' \
  --compressed
```
7) Create a Developer Portal
8) Add SOAP-API-Product with SOAP2REST.json specification
9) Generate the Markdown documentation from the wsdl by using the script in `apigee/soap-documentation` 
10) Create a page in your integrated developer portal and paste the Markdown