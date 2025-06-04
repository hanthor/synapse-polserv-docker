FROM ghcr.io/element-hq/synapse:v1.131.0@sha256:0ccf03d915a636d12bcb35f49935421445a4d644c0449cc211252663b9137cd0

# label container witht the version of the image from the FROM line
LABEL org.opencontainers.image.version="1.129.0"
LABEL org.opencontainers.image.description="Element Synapse Docker image with policy server spam checker"

RUN apt-get update && \
    apt-get install -y git
# Install the policy server checker from the git repository using pip.
RUN pip install git+https://github.com/element-hq/policyserv_spam_checker#egg=policy-server-checker
