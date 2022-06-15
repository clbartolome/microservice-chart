# test-application

This application is used in order to test the `microservice-chart`.

To test it locally use:

```sh
# Start
mvn quarkus:dev -DMESSAGE="hello"

# Test
curl http://localhost:8080/test
```