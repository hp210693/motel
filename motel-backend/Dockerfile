FROM golang:1.21.0 as debug

WORKDIR /usr/src/app


COPY . .

#RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go mod tidy

### Run the Delve debugger ###
#COPY ./dlv.sh /
#RUN chmod +x /dlv.sh 
#ENTRYPOINT [ "/dlv.sh"]