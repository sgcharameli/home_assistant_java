# syntax=docker/dockerfile:1

FROM 3.8.6-eclipse-temurin-11-alpine AS builder
RUN mvn --version

#FROM alpine:latest  
#RUN apk --no-cache add ca-certificates
#WORKDIR /root/
#COPY --from=builder /go/src/github.com/alexellis/href-counter/app ./

ARG BUILD_FROM
FROM $BUILD_FROM

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]