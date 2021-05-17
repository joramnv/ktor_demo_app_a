# README.md

This project includes project ktor-demo-app-base as a common base.



## Create and publish container image app-a:
1. Run `gradlew clean build`.
2. Run `docker build -t "ktor-demo-app-a:0.0.1-SNAPSHOT-ejcio" .`.
3. Run `docker run -d -p 8123:8123 -p 48123:48123 ktor-demo-app-a:0.0.1-SNAPSHOT-ejcio`.
4. Verify working via browser: `http://localhost:8123` and/or `http://localhost:8123/json/gson`.
5. Tag the remote repository: `docker tag ktor-demo-app-a:0.0.1-SNAPSHOT-ejcio joramnv/ktor-demo-app-a:0.0.1-SNAPSHOT-ejcio`.
6. Push the image to the remote repository: `docker push joramnv/ktor-demo-app-a:0.0.1-SNAPSHOT-ejcio` <-- in this case it is my(!) public repo. (Use your own repo. You can also choose to make a private repo namespace first via the docker hub website.)



## Local development:
Running app-a locally can be done through: `gradlew run`

Running the Dapr side car locally can be done through:
(Prerequisite is that you've the Dapr CLI installed on your machine.)
```
dapr run --components-path ./secrets --app-id app-a --app-port 48123 --app-protocol grpc --dapr-http-port 3500 --dapr-grpc-port 50001 -- waitfor FOREVER
```

- Note - I had some issues where locally Dapr could not find app-b from app-a and visa versa. I was connected to a VPN, when I turned off the VPN Dapr was functioning as normal again.
