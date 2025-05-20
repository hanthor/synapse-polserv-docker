FROM ghcr.io/element-hq/synapse:v1.130.0@sha256:a05a1e6b574c02957e1729a23462196679bed185cf169b5844be4cd04b198ccf

# label container witht the version of the image from the FROM line
LABEL org.opencontainers.image.version="1.129.0"
LABEL org.opencontainers.image.description="Element Synapse Docker image with policy server spam checker"

RUN apt-get update && \
    apt-get install -y git
# Install the policy server checker from the git repository using pip.
RUN pip install git+https://github.com/element-hq/policyserv_spam_checker#egg=policy-server-checker
