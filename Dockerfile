FROM alpine:latest as build

ARG TERRAFORM_VERSION="1.1.6"

RUN apk add --no-cache git curl openssh gnupg && \
    curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_arm64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_arm64.zip

RUN apk add --no-cache git openssh

ENTRYPOINT ["/bin/terraform"]
