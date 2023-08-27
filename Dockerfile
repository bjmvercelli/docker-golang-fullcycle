FROM golang:alpine3.18 AS builder

WORKDIR /go/src/app

COPY fullcycle.go .

RUN go build fullcycle.go

FROM scratch

COPY --from=builder /go/src/app/fullcycle .

ENTRYPOINT [ "./fullcycle" ]