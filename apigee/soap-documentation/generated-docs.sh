
echo "Generating Markdown from WSDL definition"
mkdir documentation
java -jar wsdl2doc-1.5-SNAPSHOT.jar -i ../../soap.wsdl -o documentation -f Markdown
echo "Now you need to create a page in your integrated portal to host this documentation."
echo "Find out how to do it here: "
echo "  https://cloud.google.com/apigee/docs/api-platform/publish/portal/get-started/edit-page"