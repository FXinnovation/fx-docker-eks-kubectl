FROM alpine:3.9

ENV PYTHON3_VERSION=3.6.8-r1 \
    KUBECTL_VERSION=1.11.9 \
    AWSCLI_VERSION=1.16.139 \
    AWS_IAM_AUTHENTICATOR_VERSION=1.12.7/2019-03-27    

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

USER kubectl

VOLUME /data
VOLUME /home/kubectl/.kube/config 

WORKDIR /data

ENTRYPOINT ["kubectl"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="eks-kubectl" \
      "org.label-schema.base-image.name"="alpine" \
      "org.label-schema.base-image.version"="3.9" \
      "org.label-schema.applications.python3.version"="$PYTHON3_VERSION" \
      "org.label-schema.applications.awscli.version"="$AWSCLI_VERSION" \
      "org.label-schema.applications.kubectl.version"="$KUBECTL_VERSION" \
      "org.label-schema.applications.awsiamauhenticator.version"="$AWS_IAM_AUTHENTICATOR_VERSION" \
      "org.label-schema.description"="Kubectl, aws-iam-authenticator and aws cli in a container" \
      "org.label-schema.url"="https://kubernetes.io" \
      "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-eks-kubectl" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="Provide a kubectl with aws-iam-authenticator pluggin to works with Amazon EKS"
