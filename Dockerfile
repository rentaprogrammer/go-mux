FROM golang:1.11-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]

LABEL maintainer="st-christian1@gmx.at"

# Set working directory: `/src`
WORKDIR /src


# Copy local file `main.go` to the working directory
COPY *.go go.* /src/

# Add Go dependencies
RUN go get github.com/gorilla/mux && go get github.com/lib/pq

# List items in the working directory (ls)
RUN ls -laht

# Build the GO app as myapp binary and move it to /scr/
RUN CGO_ENABLED=0 go build -o /scr/gomux

#Expose port 8010
EXPOSE 8010

# Run the service myapp when a container of this image is launched
CMD ["/scr/gomux"]
