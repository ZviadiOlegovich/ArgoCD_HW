@echo off

echo Stopping and removing existing container...
docker stop cb-api
timeout /t 1

echo Removing existing Docker image...
docker rmi cb_api_image
timeout /t 1

echo Deleting build/app executable...
del build\app
timeout /t 1

echo Building...
docker run --rm -e GOOS=linux -e GOARCH=amd64 -v C:\Users\zoshc\workspace\Golang\ArgoCD_HW:/usr/src/myapp 
-w /usr/src/myapp golang:1.20 go build -o build/app cmd/main.go
timeout /t 1

echo Building Docker image...
docker build -t argocd_hw_image .
timeout /t 1

echo Running Docker container...
docker run --rm --name argocd_hw  argocd_hw_image