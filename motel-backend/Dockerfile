FROM golang:1.21.0 as debug

WORKDIR /usr/src/app


COPY . .

#RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go mod tidy
#RUN go run main.go -b 0.0.0.0
#RUN go build
#EXPOSE 8080
#CMD [ "go run main.go", "run"]

### Run the Delve debugger ###
#COPY ./dlv.sh /
#RUN chmod +x /dlv.sh 
#ENTRYPOINT [ "/dlv.sh"]