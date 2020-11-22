FROM amazonlinux:2

LABEL name="github-action-aws-cdk-amazonlinux"
LABEL repository="https://github.com/muldos/github-action-aws-cdk-amazonlinux"
LABEL homepage="https://github.com/muldos/github-action-aws-cdk-amazonlinux"

LABEL "com.github.actions.name"="github-action-aws-cdk-amazonlinux"
LABEL "com.github.actions.description"="GitHub Action for AWS CDK based on amazonlinux"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="yellow"

RUN yum -y update
RUN curl --silent --location https://rpm.nodesource.com/setup_12.x | bash -
RUN yum -y install nodejs python3-pip zip
RUN python3 --version
RUN npm install -g aws-cdk

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
