###         ###
### STAGE 1 ###
###         ###

FROM golang:alpine AS builder

WORKDIR /app

COPY /go-files .

RUN go build -ldflags "-s -w" -o fullcycle

###         ###
### STAGE 2 ###
###         ###

FROM scratch

WORKDIR /app

COPY --from=builder /app /app

CMD ["/app/fullcycle"]
