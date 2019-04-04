FROM alpine:3.9

ENV CURL_VERSION=7.64.0-r1 \
    PY2PIP_VERSION=18.1-r0 \
    PYTHON2_VERSION=2.7.15-r3 \
    AWSCLI_VERSION=1.16.64 \
    KUBECTL_VERSION=1.11.9 \
    AWSCLI_VERSION=1.16.64 \
    AWS_IAM_AUTHENTICATOR_VERSION=1.12.7/2019-03-27    

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

VOLUME /data

WORKDIR /data

ENTRYPOINT ["kubectl"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="eks-kubectl" \
      "org.label-schema.base-image.name"="alpine" \
      "org.label-schema.base-image.version"="3.9" \
      "org.label-schema.applications.curl.version"="$CURL_VERSION" \
      "org.label-schema.applications.curl.version"="$PY2PIP_VERSION" \
      "org.label-schema.applications.curl.version"="$PYTHON2_VERSION" \
      "org.label-schema.applications.curl.version"="$AWSCLI_VERSION" \
      "org.label-schema.applications.curl.version"="$KUBECTL_VERSION" \
      "org.label-schema.applications.curl.version"="$AWSCLI_VERSION" \
      "org.label-schema.applications.curl.version"="$AWS_IAM_AUTHENTICATOR_VERSION" \
      "org.label-schema.description"="Kubectl, aws-iam-authenticator and aws cli in a container" \
      "org.label-schema.url"="https://kubernetes.io" \
      "org.label-schema.vcs-url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-eks-kubectl" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="Must be use only for kube cluster"
