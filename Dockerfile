# Dockerfile References: https://docs.docker.com/engine/reference/builder/
# Start from the latest golang base image
FROM golang:latest
# Add Maintainer Info
LABEL maintainer="Ahmed Fourat TOUZRI"
# Set the Current Working Directory inside the container
WORKDIR /app
# Copy go mod and sum files
COPY go.mod go.sum ./
# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download
# Copy the source from the current directory to the Working Directory inside the container
COPY . .
# Build the Go app
RUN go build -o main .
# This container exposes port 8000 to the outside world
EXPOSE 8000
# Run the binary program produced by `go install`
CMD ["./main"]
