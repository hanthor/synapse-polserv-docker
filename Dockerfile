FROM ghcr.io/element-hq/synapse:v1.129.0@sha256:ca832b91096279de8f6571e21757f25fd69c8ff3a8cc3c1a336280afee45be1e

# label container witht the version of the image from the FROM line
LABEL org.opencontainers.image.version="1.129.0"
LABEL org.opencontainers.image.description="Element Synapse Docker image with policy server spam checker"

RUN apt-get update && \
    apt-get install -y git
# Install the policy server checker from the git repository using pip.
RUN pip install git+https://github.com/element-hq/policyserv_spam_checker#egg=policy-server-checker
