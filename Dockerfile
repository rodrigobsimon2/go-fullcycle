FROM alpinelinux/golang as base

WORKDIR /usr/src/app

COPY ./main.go .

RUN go build main.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=base /usr/src/app/main .

ENTRYPOINT [ "./main" ]
